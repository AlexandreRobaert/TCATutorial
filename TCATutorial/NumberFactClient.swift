//
//  NumberFactClient.swift
//  TCATutorial
//
//  Created by Alexandre Robaert on 11/11/23.
//

import ComposableArchitecture
import Foundation

struct NumberFactClient {
    var fetch: (Int) async throws -> String
}

extension NumberFactClient: DependencyKey {
    static let liveValue = NumberFactClient { number in
        let (data, _) = try await URLSession.shared.data(from: URL(string: "http://numbersapi.com/\(number)")!)
        return String(decoding: data, as: UTF8.self)
    }
}

extension DependencyValues {
    
    var numberFact: NumberFactClient {
        get {
            self[NumberFactClient.self]
        }
        set {
            self[NumberFactClient.self] = newValue
        }
    }
}
