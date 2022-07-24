//
//  File.swift
//  
//
//  Created by Mathew Gacy on 7/23/22.
//

import Foundation

enum Mock {
    static var single = """
    import Common
    import ComposableArchitecture
    import Foundation

    public struct FooDomain: Equatable {
        public struct State: Equatable, AlertingState {
            public var name: String
            @BindableState public var alertState: AlertState<Action>?

            public init(name: String = "") {
                self.name = name
            }
        }

        public enum Action: Equatable, BindableAction, ErrorableAction {
            case binding(BindingAction<State>)
            case error(AppError?)
            case onAppear
        }

        public struct Environment {
            public static var live = Self()
            public static var mock = Self()
        }

        public static let reducer = Reducer<State, Action, SystemEnvironment<Environment>> { state, action, _ in
            switch action {
            case .binding:
                return .none

            case .error:
                return .none

            case .onAppear:
                state.name = "Foo"
                return .none
            }
        }
        .binding()
        .error()
    }
    """

    static var combined = #"""
    import Common
    import ComposableArchitecture
    import Foo
    import Foundation

    public struct BarDomain: Equatable {
        public struct State: Equatable, AlertingState {
            @BindableState public var alertState: AlertState<Action>?
            var fooState: FooDomain.State?

            public init(fooState: FooDomain.State?) {
                self.fooState = fooState
            }
        }

        public enum Action: Equatable, BindableAction, ErrorableAction {
            case binding(BindingAction<State>)
            case error(AppError?)
            case foo(FooDomain.Action)
            case onAppear
        }

        public struct Environment {
            var fooEnvironment: FooDomain.Environment

            public static var live = Self(
                fooEnvironment: .live
            )

            public static var mock = Self(
                fooEnvironment: .mock
            )
        }

        public static let reducer = Reducer<State, Action, SystemEnvironment<Environment>>.combine(
            FooDomain.reducer
                .optional()
                .pullback(
                    state: \.fooState,
                    action: /Action.foo,
                    environment: { $0.map(\.fooEnvironment) }),
            Reducer { state, action, _ in
                switch action {
                case .binding:
                    return .none

                case .error:
                    return .none

                case .foo:
                    return .none

                case .onAppear:
                    return .none
                }
            }
            .binding()
            .error()
        )
    }
    """#
}
