//
//  File.swift
//  
//
//  Created by Chris Gaafary on 12/21/21.
//

import Foundation
import SwiftUI

public struct AuthenticationActionsKey: EnvironmentKey {
    public static let defaultValue: AuthenticationActions = .live
}

public extension EnvironmentValues {
    var authenticationActions: AuthenticationActions {
        get { self[AuthenticationActionsKey.self] }
        set { self[AuthenticationActionsKey.self] = newValue }
    }
}
