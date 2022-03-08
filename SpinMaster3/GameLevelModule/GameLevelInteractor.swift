//
//  GameLevelInteractor.swift
//  SpinMaster3
//
//  Created by Alexandre G on 01/03/2022.
//

import Foundation
import Combine

protocol GameLevelInteractorProtocol: AnyObject {
    var actualDirection: AnyPublisher<String, Never> { get }
    var actualScore: AnyPublisher<String, Never> { get }

    func updateScore()
}

final class GameLevelInteractor {
    private let gameModel: GameModelProtocol

    var actualDirectionSubject = CurrentValueSubject<String, Never>("")
    var actualScoreSubject = CurrentValueSubject<String, Never>("")

    private var cancellables = Set<AnyCancellable>()

    init(directions: [Double]) {
        gameModel = GameModel(directions: directions)

        gameModel.direction
            .sink { [weak self] directions in
                guard let self = self else { return }
                self.actualDirectionSubject.send(directions)
            }
            .store(in: &cancellables)

        gameModel.scoreText
            .sink { [weak self] score in
                guard let self = self else { return }
                self.actualScoreSubject.send(score)
            }
            .store(in: &cancellables)
    }

}

extension GameLevelInteractor: GameLevelInteractorProtocol {
    var actualDirection: AnyPublisher<String, Never> { actualDirectionSubject.eraseToAnyPublisher() }
    var actualScore: AnyPublisher<String, Never> { actualScoreSubject.eraseToAnyPublisher() }

    func updateScore() {
        gameModel.updateScore()
    }
}
