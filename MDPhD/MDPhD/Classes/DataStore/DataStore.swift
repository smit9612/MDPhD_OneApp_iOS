//
//  DataStore.swift
//  CoreServices
//
//  Created by Arbab Khan on 2017-10-16.
//  Copyright © 2017 Rogers. All rights reserved.
//

import Foundation

/// Contains credentials information.
public struct Credentials {

    public var email: String
    public var password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

struct DataStore {

    private var keychainStore = KeychainStore(serviceName: Bundle.main.bundleIdentifier ?? "CoreServices")
}

extension DataStore: Storable {

    public func set(_ value: Bool, forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.set(value, forKey: key.value)
        case .keychain:
            keychainStore.set(value, forKey: key.value)
        }
    }

    public func bool(forKey key: DataStoreKeyable) -> Bool {
        switch key.type {
        case .userDefaults:
            return UserDefaults.standard.bool(forKey: key.value)
        case .keychain:
            return keychainStore.bool(key.value) ?? false
        }
    }

    public func set(_ value: Int, forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.set(value, forKey: key.value)
        case .keychain:
            keychainStore.set(value, forKey: key.value)
        }
    }

    public func int(forKey key: DataStoreKeyable) -> Int {
        switch key.type {
        case .userDefaults:
            return UserDefaults.standard.integer(forKey: key.value)
        case .keychain:
            return keychainStore.int(key.value) ?? 0
        }
    }

    public func set(_ value: Double, forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.set(value, forKey: key.value)
        case .keychain:
            keychainStore.set(value, forKey: key.value)
        }
    }

    public func double(forKey key: DataStoreKeyable) -> Double {
        switch key.type {
        case .userDefaults:
            return UserDefaults.standard.double(forKey: key.value)
        case .keychain:
            return keychainStore.double(key.value) ?? 0
        }
    }

    public func set(_ value: Float, forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.set(value, forKey: key.value)
        case .keychain:
            keychainStore.set(value, forKey: key.value)
        }
    }

    public func float(forKey key: DataStoreKeyable) -> Float {
        switch key.type {
        case .userDefaults:
            return UserDefaults.standard.float(forKey: key.value)
        case .keychain:
            return keychainStore.float(key.value) ?? 0
        }
    }

    public func set(_ value: String, forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.set(value, forKey: key.value)
        case .keychain:
            keychainStore.set(value, forKey: key.value)
        }
    }

    public func string(forKey key: DataStoreKeyable) -> String? {
        switch key.type {
        case .userDefaults:
            return UserDefaults.standard.string(forKey: key.value)
        case .keychain:
            return keychainStore.string(key.value)
        }
    }

    public func set(_ value: Any, forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.set(value, forKey: key.value)
        case .keychain:
            keychainStore.set(NSKeyedArchiver.archivedData(withRootObject: value), forKey: key.value)
        }
    }

    public func object(forKey key: DataStoreKeyable) -> Any? {
        switch key.type {
        case .userDefaults:
            return UserDefaults.standard.object(forKey: key.value)
        case .keychain:
            guard let data = keychainStore.data(key.value) else { return nil }
            return NSKeyedUnarchiver.unarchiveObject(with: data)
        }
    }

    public func set(_ value: Credentials, forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.set(value, forKey: key.value)
        case .keychain(let withBiometrics):
            keychainStore.saveCredentials(value, forKey: key.value, withBiometrics: withBiometrics)
        }
    }

    public func credentials(forKey key: DataStoreKeyable, promptMessage: String? = nil) -> (Credentials?, KeyChainSecurityErrorCode) {
        switch key.type {
        case .userDefaults:
            return (nil, .success)
        case .keychain(let withBiometrics):
            return keychainStore.credentials(key.value, withBiometrics: withBiometrics, promptMessage: promptMessage)
        }
    }

    public func removeObject(forKey key: DataStoreKeyable) {
        switch key.type {
        case .userDefaults:
            UserDefaults.standard.removeObject(forKey: key.value)
        case .keychain:
            keychainStore.delete(key.value)
        }
    }
}
