//
//  File.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import SwiftUI
import FirebaseAuth

public struct AuthKey: EnvironmentKey {
    public static let defaultValue: Auth = .live
}

public extension EnvironmentValues {
    var authentication: Auth {
        get { self[AuthKey.self] }
        set { self[AuthKey.self] = newValue }
    }
}

extension Auth {
    static let live: Auth = Auth.auth()
    static let emulated: Auth = {
        let auth = Auth.auth()
        auth.useEmulator(withHost: "localhost", port: 9099)
        return auth
    }()
}
