//
//  DeviceConnectionContext.swift
//  StikJIT
//

import Foundation
import UIKit

enum DeviceConnectionContext {
    static var targetIPAddress: String {
        let stored = UserDefaults.standard.string(forKey: "customTargetIP")
        if let stored, !stored.isEmpty {
            return stored
        }
        return "10.7.0.1"  // Loopback VPN
    }
    
    static var isModernRSD: Bool {
        let version = UIDevice.current.systemVersion
        return version.compare("17.4", options: .numeric) != .orderedAscending
    }
    
    static var connectionMode: String {
        isModernRSD ? "RSD (iOS 17.4+)" : "Legacy Lockdown (iOS 16)"
    }
}
