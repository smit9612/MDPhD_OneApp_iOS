//
//  NetworkReachabilityManager.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-30.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import SystemConfiguration

protocol NetworkReachabilityManager {}

extension NetworkReachabilityManager {
    
    var isNetworkReachable: Bool {
        // Initializes the socket IPv4 address struct
        var address = sockaddr_in()
        address.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        address.sin_family = sa_family_t(AF_INET)
        
        // Passes the reference of the struct
        let networkReachability = withUnsafePointer(to: &address, { pointer in
            // Converts to a generic socket address
            return pointer.withMemoryRebound(to: sockaddr.self, capacity: MemoryLayout<sockaddr>.size) {
                // $0 is the pointer to `sockaddr`
                return SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        })
        guard let reachability = networkReachability else { return false }
        
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        return isReachable(with: flags)
    }
    
    private func isReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }
    
}
