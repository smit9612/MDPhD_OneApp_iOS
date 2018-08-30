//
//  Storable.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-30.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

public enum DataStoreType {
    case keychain(withBiometrics: Bool)
    case userDefaults
}

public protocol DataStoreKeyable {

    /// The value of the key the object will be stored with
    var value: String { get }

    /// The datastore type whether it is keychain or userDefaults
    var type: DataStoreType { get }
}

extension DataStoreKeyable where Self: RawRepresentable, Self.RawValue == String {

    public var value: String {
        return rawValue
    }
}

public protocol Storable {

    /// Sets the bool value for the specified key.
    ///
    /// - Parameters:
    ///   - value: The bool value to save.
    ///   - key: The key to save the value with.
    func set(_ value: Bool, forKey key: DataStoreKeyable)

    /// Retrieves the bool value for the specified key.
    ///
    /// - Parameter key: The key value to return the bool for.
    /// - Returns: The bool value of the specified key.
    func bool(forKey key: DataStoreKeyable) -> Bool

    /// Sets the int value for the specified key.
    ///
    /// - Parameters:
    ///   - value: The int value to save.
    ///   - key: The key to save the value with.
    func set(_ value: Int, forKey key: DataStoreKeyable)

    /// Retrieves the int value for the specified key.
    ///
    /// - Parameter key: The key value to return the int for.
    /// - Returns: The int value of the specified key.
    func int(forKey key: DataStoreKeyable) -> Int

    /// Sets the double value for the specified key.
    ///
    /// - Parameters:
    ///   - value: The double value to save.
    ///   - key: The key to save the value with.
    func set(_ value: Double, forKey key: DataStoreKeyable)

    /// Retrieves the double value of the specified key.
    ///
    /// - Parameter key: The key value to return the double for.
    /// - Returns: The double value of the specified key.
    func double(forKey key: DataStoreKeyable) -> Double

    /// Sets the float value for the specified key.
    ///
    /// - Parameters:
    ///   - value: The float value to save.
    ///   - key: The key to save the value with.
    func set(_ value: Float, forKey key: DataStoreKeyable)

    /// Retrieves the float value of the specified key.
    ///
    /// - Parameter key: The key value to return the float for.
    /// - Returns: The float value of the specified key.
    func float(forKey key: DataStoreKeyable) -> Float

    /// Sets the string value for the specified key.
    ///
    /// - Parameters:
    ///   - value: The string value to save.
    ///   - key: The key to save the value with.
    func set(_ value: String, forKey key: DataStoreKeyable)

    /// Retrieve the string value for the specified key.
    ///
    /// - Parameter key: The key value to return the string for.
    /// - Returns: The string value for the specified key.
    func string(forKey key: DataStoreKeyable) -> String?

    /// Sets the object value for the specified key.
    ///
    /// - Parameters:
    ///   - value: The object value to save.
    ///   - key: The key to save the value with.
    func set(_ value: Any, forKey key: DataStoreKeyable)

    /// Retrieve the object value for the specified key.
    ///
    /// - Parameter key: The key to return the object for.
    /// - Returns: The object for the specified key.
    func object(forKey key: DataStoreKeyable) -> Any?

    /// Sets the credentials value for the specified key.
    ///
    /// - Parameters:
    ///   - value: The credentials value to save.
    ///   - key: The key to save the value with.
    func set(_ value: Credentials, forKey key: DataStoreKeyable)

    /// Retrieve the credentials value for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key to return the credentials for.
    ///   - promptMessage: The string describing the operation for which the app is attempting to authenticate.
    /// - Returns:
    ///   - Credentials: The credentials for the specified key.
    ///   - KeyChainSecurityErrorCode: A error code. See KeychainStore.swift
    func credentials(forKey key: DataStoreKeyable, promptMessage: String?) -> (Credentials?, KeyChainSecurityErrorCode)

    /// Removes the value for the specified key.
    ///
    /// - Parameter key: They key to remove the object for.
    func removeObject(forKey key: DataStoreKeyable)
}



