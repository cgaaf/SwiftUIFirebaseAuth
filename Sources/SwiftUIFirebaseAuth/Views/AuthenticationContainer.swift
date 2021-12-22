//
//  SwiftUIView.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import SwiftUI

public struct AuthenticationContainer<Content: View>: View {
    @StateObject var authStateController: AuthenticationStateController
    let authActions: AuthenticationActions
    
    let content: () -> Content
    
    public var body: some View {
        content()
            .environment(\.authenticationState, authStateController.authenticationState)
            .environment(\.authenticationActions, authActions)
    }
    
    public init(emulated: Bool = false, content: @escaping () -> Content) {
        _authStateController = StateObject(wrappedValue: emulated ? .emulated : .live)
        self.authActions = emulated ? .emulated : .live
        self.content = content
    }
}
