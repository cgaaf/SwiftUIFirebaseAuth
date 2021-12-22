//
//  FBAuth.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import Foundation
import FirebaseAuth
import FirebaseAuthCombineSwift

public enum AuthenticationState {
    case signedIn(User)
    case signedOut
}

public class AuthenticationStateController: ObservableObject {
    private let auth: Auth
    
    @Published public var authenticationState: AuthenticationState = .signedOut
    
    public static let live = AuthenticationStateController()
    public static let emulated = AuthenticationStateController(emulated: true)
    
    private init(emulated: Bool = false) {
        auth = Auth.auth()
        if emulated {
            auth.useEmulator(withHost: "localhost", port: 9099)
        }
        
        auth.authStateDidChangePublisher()
            .map { (user: User?) -> AuthenticationState in
                guard let user = user else {
                    return .signedOut
                }
                
                return .signedIn(user)
            }
            .assign(to: &$authenticationState)
    }
}
