//
//  Authentication State.swift
//  
//
//  Created by Chris Gaafary on 12/30/21.
//

import Foundation
import FirebaseAuth

public enum AuthenticationState {
    case signedIn(user: UserInfo)
    case signedOut
}
