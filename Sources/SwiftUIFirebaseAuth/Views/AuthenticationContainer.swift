//
//  SwiftUIView.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import SwiftUI
import FirebaseAuth

/// A container view that adds the current authentication state and methods to the environment of it's child view.
///
/// Use an `AuthenticationContainer` to add firebase authentication state and methods to the environment
/// of child views. For accessing current firebase authentication state which includes ``UserInfo`` if the user is
/// signed in, an ``AuthenticationState`` object is passed into the environment. Additionally, a Firebase
/// ``Auth`` object is added to the environment to provide access to Firebase authentication methods.
///
/// Access authentication state in the ``Environment`` of it's child views:
///
///     struct ParentView: View {
///         var body: some View {
///             AuthenticationContainer {
///                 ChildView()
///             }
///         }
///     }
///
///     struct ChildView: View {
///         @Environment(\.authenticationState) var authenticationState
///         @Environment(\.auth) var auth
///
///         var body: some View {
///             switch authenticationState {
///             case .signedIn(let user):
///                 VStack {
///                     UserDetailView(user: user)
///                     Button("Sign Out") {
///                         try auth.signOut()
///                     }
///                 }
///
///             case .signedOut:
///                 AuthenticationView()
///             }
///         }
///     }
///     
public struct AuthenticationContainer<Content: View>: View {
    /// An ``ObservableObject`` that publishes changes to the authentication state and exposes a configured
    /// Firebase ``Auth`` object.
    @StateObject private var authStateController: AuthenticationStateController
    
    private let content: () -> Content
    
    public var body: some View {
        content()
            .environment(\.authenticationState, authStateController.authenticationState)
            .environment(\.authentication, authStateController.auth)
    }
    
    /// Creates an `AuthenticationContainer` which adds current authentication state and authentication methods
    /// to it's child view. Set the emulated parameter to `true` to configure the container to use the Firebase emulator.
    /// - Parameters:
    ///   - emulated: Configures FirebaseAuth to use the Firebase Emulator if set to true
    ///   - content: a closure that produces the content that the `AuthenticationContainer` wraps
    public init(emulated: Bool = false, content: @escaping () -> Content) {
        _authStateController = StateObject(wrappedValue: emulated ? .emulated : .live)
        self.content = content
    }
}

public extension View {
    func addAuthentication(emulated: Bool = false) -> some View {
        AuthenticationContainer(emulated: emulated) {
            self
        }
    }
}
