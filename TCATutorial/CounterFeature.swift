//
//  CounterFeature.swift
//  TCATutorial
//
//  Created by Alexandre Robaert on 22/10/23.
//

import SwiftUI
import ComposableArchitecture

struct CounterFeature: Reducer {
    
    struct State: Equatable {
        var count = 0
    }
    
    enum Action {
        case decrementButtomTapped
        case incrementButtomTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .decrementButtomTapped:
            state.count -= 1
            return .none
        case .incrementButtomTapped:
            state.count += 1
            return .none
        }
    }
}

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("\(viewStore.state.count)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                HStack {
                    Button("-") {
                        viewStore.send(.decrementButtomTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    
                    Button("+") {
                        viewStore.send(.incrementButtomTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    CounterView(store: Store(initialState: CounterFeature.State(), reducer: {
        CounterFeature()
    }))
}
