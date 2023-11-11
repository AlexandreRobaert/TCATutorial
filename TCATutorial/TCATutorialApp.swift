//
//  TCATutorialApp.swift
//  TCATutorial
//
//  Created by Alexandre Robaert on 22/10/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCATutorialApp: App {
    
    public static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: TCATutorialApp.store)
        }
    }
}
