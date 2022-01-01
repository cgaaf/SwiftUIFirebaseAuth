# SwiftUIFirebaseAuth

This package provides a convenient wrapper for FirebaseAuth for a more declarative and idiomatic
approach for SwiftUI

## Overview
Use an AuthenticationContainer to add firebase authentication state and methods to the environment of child views. 
For accessing current firebase authentication state which includes UserInfo if the user is signed in, an 
`AuthenticationState` object is passed into the environment. Additionally, a Firebase Auth object is added to the 
environment to provide access to Firebase authentication methods.

## Example

``` Swift
import SwiftUI
import SwiftUIFirebaseAuth

struct ExampleView: View {
    var body: some View {
        AuthenticationContainer {
            ChildView()
        }
    }
}

struct ChildView: View {
    @Environment(\.authenticationState) var authenticationState
    
    var body: some View {
        switch authenticationState {
        case .signedIn(user: let user):
            AuthenticatedView(username: user.displayName!)
            
        case .signedOut:
            AuthenticationView()
        }
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChildView()
                .environment(\.authenticationState, .signedIn(user: .preview))
            
            ChildView()
                .environment(\.authenticationState, .signedOut)
        }
    }
}
```

