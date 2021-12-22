//
//  SwiftUIView.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import SwiftUI

struct AuthenticationContainer<Content: View>: View {
    @StateObject var authStateController: AuthenticationStateController
    let authActions: AuthenticationActions
    
    let content: () -> Content
    
    var body: some View {
        content()
            .environment(\.authenticationState, authStateController.authenticationState)
            .environment(\.authenticationActions, authActions)
    }
    
    init(emulated: Bool = false, content: @escaping () -> Content) {
        _authStateController = StateObject(wrappedValue: emulated ? .emulated : .live)
        self.authActions = emulated ? .emulated : .live
        self.content = content
    }
}
