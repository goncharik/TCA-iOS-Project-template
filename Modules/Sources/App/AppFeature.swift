import ComposableArchitecture
import Details
import SwiftUI

@Reducer
public struct AppFeature {
    @ObservableState
    public struct State: Equatable {
        public var appDelegate = AppDelegateReducer.State()
        public var path = StackState<Path.State>()
        public var tabBarScreen = TabBarScreenFeature.State()

        public init() {}
    }

    public enum Action {
        case appDelegate(AppDelegateReducer.Action)
        case path(StackAction<Path.State, Path.Action>)
        case tabBarScreen(TabBarScreenFeature.Action)
    }

    @Reducer(state: .equatable)
    public enum Path {
        case details(DetailsFeature)
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Scope(state: \.appDelegate, action: \.appDelegate) {
            AppDelegateReducer()
        }
        Scope(state: \.tabBarScreen, action: \.tabBarScreen) {
            TabBarScreenFeature()
        }
        Reduce { state, action in
            switch action {
            case .appDelegate:
                return .none
            case .tabBarScreen:
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)        
    }
}

public struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>
    @Environment(\.layoutDirection) var layoutDirection

    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }

    public var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            TabBarScreenView(store: store.scope(state: \.tabBarScreen, action: \.tabBarScreen))
        } destination: { store in
            switch store.case {
            case let .details(store):
                DetailsView(store: store)
            }
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
