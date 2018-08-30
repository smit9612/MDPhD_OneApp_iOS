//
//  KeychainStore.swift
//  CoreServices
//
//  Created by Arbab Khan on 2017-10-25.
//  Copyright © 2017 Rogers. All rights reserved.
//

import Foundation

/// An enum corresponding to the mapped error code from a result code returned by SecItemCopyMatching.
public enum KeyChainSecurityErrorCode {

    case success
    case userCancel
    case authenticationFaild
    case itemNotFound
    case unknown
}

struct KeychainStore {

    private var serviceName: String

    init(serviceName: String) {
        self.serviceName = serviceName
    }

    @discardableResult
    func set(_ value: Data, forKey key: String) -> Bool {
        var query = queryDictionary(forKey: key)
        query[kSecAttrAccessible as String] = kSecAttrAccessibleWhenUnlocked
        query[kSecValueData as String] = value

        let err = SecItemAdd(query as CFDictionary, nil)
        if err == errSecSuccess {
            return true
        } else if err == errSecDuplicateItem {
            delete(key)
            return set(value, forKey: key)
        } else {
            return false
        }
    }

    @discardableResult
    func set(_ value: String, forKey key: String) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        return set(data, forKey: key)
    }

    @discardableResult
    func set(_ value: Bool, forKey key: String) -> Bool {
        let data = Data(bytes: value ? [1] : [0])
        return set(data, forKey: key)
    }

    @discardableResult
    func set(_ value: Int, forKey key: String) -> Bool {
        var intValue = value
        let data = Data(bytes: &intValue, count: MemoryLayout.size(ofValue: intValue))
        return set(data, forKey: key)
    }

    @discardableResult
    func set(_ value: Float, forKey key: String) -> Bool {
        var floatValue = value
        let data = Data(bytes: &floatValue, count: MemoryLayout.size(ofValue: floatValue))
        return set(data, forKey: key)
    }

    @discardableResult
    func set(_ value: Double, forKey key: String) -> Bool {
        var doubleValue = value
        let data = Data(bytes: &doubleValue, count: MemoryLayout.size(ofValue: doubleValue))
        return set(data, forKey: key)
    }

    func data(_ key: String) -> Data? {
        var query = queryDictionary(forKey: key)
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecMatchLimit as String] = kSecMatchLimitOne

        var result: AnyObject?
        let err = SecItemCopyMatching(query as CFDictionary, &result)
        return (err == noErr) ? (result as? Data) : nil
    }

    func string(_ key: String) -> String? {
        guard let data = data(key) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    func bool(_ key: String) -> Bool? {
        guard let data = data(key), let firstBit = data.first else { return nil }
        return firstBit == 1
    }

    func int(_ key: String) -> Int? {
        guard let data = data(key) else { return nil }
        return data.to(type: Int.self)
    }

    func double(_ key: String) -> Double? {
        guard let data = data(key) else { return nil }
        return data.to(type: Double.self)
    }

    func float(_ key: String) -> Float? {
        guard let data = data(key) else { return nil }
        return data.to(type: Float.self)
    }

    @discardableResult
    func delete(_ key: String) -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
            kSecAttrGeneric as String: key]
        return SecItemDelete(query as CFDictionary) == noErr
    }

    @discardableResult
    func clearAll() -> Bool {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
        return SecItemDelete(query as CFDictionary) == noErr
    }

    private func queryDictionary(forKey key: String) -> [String: Any] {
        var query: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
        query[kSecAttrService as String] = serviceName

        let encodedIdentifier: Data? = key.data(using: String.Encoding.utf8)

        query[kSecAttrGeneric as String] = encodedIdentifier
        query[kSecAttrAccount as String] = encodedIdentifier

        return query
    }

    @discardableResult
    func saveCredentials(_ credential: Credentials, forKey key: String, withBiometrics: Bool) -> Bool {
        guard let sacRef = SecAccessControlCreateWithFlags(kCFAllocatorDefault,
                                                           kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
                                                            .touchIDCurrentSet, nil) else { return false }

        let attributes: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrGeneric: key,
            kSecAttrAccount: credential.email,
            kSecValueData: credential.password.data(using: String.Encoding.utf8) as Any,
            kSecUseAuthenticationUI: kSecUseAuthenticationUIAllow,
            kSecReturnData: false
        ]

        if withBiometrics {
            attributes[kSecAttrAccessControl] = sacRef
        } else {
            attributes[kSecAttrAccessible] = kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        }

        return SecItemAdd(attributes as CFDictionary, nil) == noErr
    }

    public func credentials(_ key: String, withBiometrics: Bool, promptMessage: String?) -> (Credentials?, KeyChainSecurityErrorCode) {
        var result: AnyObject?
        let query: NSMutableDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrGeneric: key,
            kSecReturnData: true,
            kSecReturnAttributes: true,
            kSecUseAuthenticationUI: withBiometrics ? kSecUseAuthenticationUIAllow : kSecUseAuthenticationUISkip
        ]

        if let promptMessage = promptMessage {
            query[kSecUseOperationPrompt] = promptMessage
        }

        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status == noErr {
            guard let items = result as? NSDictionary,
                let account = items.object(forKey: String(kSecAttrAccount)) as? String,
                let pwData = items.object(forKey: String(kSecValueData)) as? Data,
                let password = String(data: pwData, encoding: .utf8) else { return (nil, status.keyChainSecurityErrorCode) }

            return (Credentials(email: account, password: password), status.keyChainSecurityErrorCode)
        }
        return (nil, status.keyChainSecurityErrorCode)
    }
}

extension Data {

    fileprivate func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.pointee }
    }
}

extension OSStatus {

    var keyChainSecurityErrorCode: KeyChainSecurityErrorCode {
        switch self {
        case errSecSuccess:
            return .success
        case errSecUserCanceled:
            return .userCancel
        case errSecAuthFailed:
            return .authenticationFaild
        case errSecItemNotFound:
            return .itemNotFound
        default:
            return .unknown
        }
    }
}
