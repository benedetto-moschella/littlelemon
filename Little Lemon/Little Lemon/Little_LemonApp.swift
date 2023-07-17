//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Benedetto Moschella on 03/07/23.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    var body: some Scene {
        WindowGroup {
            if (UserDefaults.standard.bool(forKey: kisLoggedOut)) {
                Onboarding1()
            } else {
                Home()
            }
            
        }
    }
}
