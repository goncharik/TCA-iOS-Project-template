import ComposableArchitecture
import Resources
import SFSafeSymbols
import SwiftUI

@Reducer
public struct TabBarScreenFeature {
    @ObservableState
    public struct State: Equatable {
        public init() { }
    }

    public enum Action: Equatable {
        case onAppear
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            }
    	}
    }
}

// MARK: - View

public struct TabBarScreenView: View {
    @Bindable var store: StoreOf<TabBarScreenFeature>
    public init(store: StoreOf<TabBarScreenFeature>) {
        self.store = store
    }

    public var body: some View {
        ZStack {
            Text("TabBarScreenView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear { store.send(.onAppear) }
        .navigationTitle("TabBarScreenView")
    }
}

// MARK: - Preview

#Preview {
    TabBarScreenView(
        store: Store(
            initialState: TabBarScreenFeature.State(),
            reducer: {
                TabBarScreenFeature()
                    ._printChanges()
            }
        )
    )
}
