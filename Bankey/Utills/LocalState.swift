//
//  LocalState.swift
//  Bankey App
//
//  Created by Mustafa Nour on 05/01/2026.
//

import Foundation

// MARK: -  user defaults values which assined in the application database (no sensitive data should put here )

class LocalState {
    private enum keys: String {
        case hasOnboarded
    }

    public static var hasOnboraded: Bool {
        get {
            // when u call, it returns the current value of the
            return UserDefaults.standard.bool(
                forKey: keys.hasOnboarded.rawValue
            )
        }
        // when u wanna change the state of the currunt state or set a new value to it
        set(newValue) {
            UserDefaults.standard.set(
                newValue,
                forKey: keys.hasOnboarded.rawValue
            )
            // MARK: -  deprecated (apple now manage the race byond ther scene )
            UserDefaults.standard.synchronize()
        }
    }

}
