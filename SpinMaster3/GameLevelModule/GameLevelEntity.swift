//
//  GameLevelEntity.swift
//  SpinMaster3
//
//  Created by Alexandre G on 01/03/2022.
//

import Foundation
import Combine

protocol GameModelProtocol: AnyObject {
    var direction: AnyPublisher<String, Never> { get }
    var scoreText: AnyPublisher<String, Never> { get }

    func updateScore()
}

class GameModel {
    var score: Int = 0
    var directions: [Double] = [90, 65, 145, 270, 10]
    var indexDirections = 0

    var directionSubject = CurrentValueSubject<String, Never>("")
    var scoreTextSubject = CurrentValueSubject<String, Never>("")

    init(directions: [Double] = [10.0, 20.0, 30.0]) {
        self.directions = directions
        directionSubject.send(String(directions[indexDirections]))
    }

}

extension GameModel: GameModelProtocol {
    var direction: AnyPublisher<String, Never> { directionSubject.eraseToAnyPublisher() }
    var scoreText: AnyPublisher<String, Never> { scoreTextSubject.eraseToAnyPublisher() }

    func updateScore() {
        if indexDirections < directions.count - 1 {
            indexDirections += 1
            score += 1
            directionSubject.send(String(directions[indexDirections]))
            scoreTextSubject.send(String(score))
        }
    }
}
