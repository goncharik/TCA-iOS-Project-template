import ComposableArchitecture
import Resources
import SFSafeSymbols
import SwiftUI

@Reducer
public struct DetailsFeature {
    @ObservableState
    public struct State: Equatable {
        public init() { }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case onAppear
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .onAppear:
    		    return .none
            }
        }
    }
}

// MARK: - View

public struct DetailsView: View {
    @Bindable var store: StoreOf<DetailsFeature>
    public init(store: StoreOf<DetailsFeature>) {
        self.store = store
    }
    public var body: some View {
        ZStack {
            Text("DetailsView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear { store.send(.onAppear) }
        .navigationTitle("DetailsView")
    }
}

// MARK: - Preview

#Preview {
    DetailsView(
        store: Store(
            initialState: DetailsFeature.State(),
            reducer: {
                DetailsFeature()
                    ._printChanges()
            }
        )
    )
}
