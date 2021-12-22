//
//  File.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import Foundation
import SwiftUI

public struct AuthenticationStateKey: EnvironmentKey {
    public static let defaultValue: AuthenticationState = .signedOut
}

public extension EnvironmentValues {
    var authenticationState: AuthenticationState {
        get { self[AuthenticationStateKey.self] }
        set { self[AuthenticationStateKey.self] = newValue }
    }
}
