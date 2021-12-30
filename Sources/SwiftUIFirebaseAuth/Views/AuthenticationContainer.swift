//
//  SwiftUIView.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import SwiftUI
import FirebaseAuth

public struct AuthenticationContainer<Content: View>: View {
    @StateObject var authStateController: AuthenticationStateController
    let auth: Auth
    
    let content: () -> Content
    
    public var body: some View {
        content()
            .environment(\.authenticationState, authStateController.authenticationState)
            .environment(\.authentication, auth)
    }
    
    public init(emulated: Bool = false, content: @escaping () -> Content) {
        _authStateController = StateObject(wrappedValue: emulated ? .emulated : .live)
        self.auth = emulated ? .emulated : .live
        self.content = content
    }
}

extension View {
    func addAuthentication(emulated: Bool = false) -> some View {
        AuthenticationContainer(emulated: emulated) {
            self
        }
    }
}
