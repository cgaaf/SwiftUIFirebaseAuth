//
//  File.swift
//  
//
//  Created by Chris Gaafary on 12/25/21.
//

import Foundation
import Firebase

public protocol UserType: Codable, Identifiable {
    var id: String { get }
    var email: String { get }
    var displayName: String { get }
    
    init(from firebaseUser: User)
    init(id: String, email: String, displayName: String)
}

public extension UserType {
    init(from firebaseUser: User) throws {
        guard let firebaseEmail = firebaseUser.email else {
            throw UserTypeInitError.noFirebaseEmail
        }
        
        guard let firebaseDisplayName = firebaseUser.displayName else {
            throw UserTypeInitError.noFirebaseDisplayName
        }
        
        self.init(id: firebaseUser.uid, email: firebaseEmail, displayName: firebaseDisplayName)
    }
}

public enum UserTypeInitError: Error {
    case noFirebaseEmail
    case noFirebaseDisplayName
}
