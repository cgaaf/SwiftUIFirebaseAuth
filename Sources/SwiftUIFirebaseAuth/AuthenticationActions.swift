//
//  File.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import Foundation
import FirebaseAuth

public struct AuthenticationActions {
    private let auth: Auth
    
    public static let live = AuthenticationActions()
    public static let emulated = AuthenticationActions(emulated: true)
    
    init(emulated: Bool = false) {
        auth = Auth.auth()
        if emulated {
            auth.useEmulator(withHost: "localhost", port: 9099)
        }
    }
    
    public func createUser(withEmail email: String, password: String) async throws -> AuthDataResult {
        try await auth.createUser(withEmail: email, password: password)
    }
    
    public func signIn(withEmail email: String, password: String) async throws -> AuthDataResult {
        try await auth.signIn(withEmail: email, password: password)
    }
    
    public func signOut() throws {
        try auth.signOut()
    }
    
    public func changeDisplayName(to newName: String) async throws {
        let changeRequest = auth.currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = newName
        try await changeRequest?.commitChanges()
    }
    
    public func resetPassword(withEmail email: String) async throws {
        try await auth.sendPasswordReset(withEmail: email)
    }
}
