//
//  GameLevelPresenter.swift
//  SpinMaster3
//
//  Created by Alexandre G on 01/03/2022.
//

import Foundation
import Combine

// Cannot use a protocol to refresh swiftUI views (or there is a solution i'm not aware of)
// We make the presenter as an observable object so that our view are updated when our published property are set

final class GameLevelPresenter: ObservableObject {

    private let interactor: GameLevelInteractorProtocol
    private let router: GameLevelRouterProtocol

    @Published private(set) var directionPublisher: String = ""

    private var cancellables = Set<AnyCancellable>()

    init(interactor: GameLevelInteractorProtocol, router: GameLevelRouterProtocol) {
        self.interactor = interactor
        self.router = router

        interactor.actualDirection
            .sink { [weak self] direction in
                guard let self = self else { return }
                self.directionPublisher = direction
            }
            .store(in: &cancellables)
    }

    // Navigation with router

    func presentSecondView() {
        router.presentSecondView()
    }

    // Business logic with interactor

    func updateScore() {
        interactor.updateScore()
    }
}
