//
//  File.swift
//  
//
//  Created by Chris Gaafary on 12/25/21.
//

import Foundation
import Firebase

public protocol UserType {
    var uid: String { get }
    var email: String? { get }
    var displayName: String? { get }
}

public enum UserTypeInitError: Error {
    case noFirebaseEmail
    case noFirebaseDisplayName
}

extension User: UserType {}


