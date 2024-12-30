import ComposableArchitecture
import Foundation

@Reducer
public struct AppDelegateReducer {
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: Equatable {
        case didFinishLaunching
        case openUrl(URL)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didFinishLaunching:
                return .none
            case let .openUrl(url):
                return .none
            }
        }
    }
}
