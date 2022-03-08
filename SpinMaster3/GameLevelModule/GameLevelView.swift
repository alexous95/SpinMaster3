//
//  GameLevelView.swift
//  SpinMaster3
//
//  Created by Alexandre G on 01/03/2022.
//

import SwiftUI

struct GameLevelView: View {
    @ObservedObject var presenter: GameLevelPresenter

    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World! The current direction is \(presenter.directionPublisher)")

            HStack(spacing: 10) {
                Button {
                    presenter.presentSecondView()
                } label: {
                    Text("Second View")
                        .padding(.all, 20)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(lineWidth: 2))
                }

                Button {
                    presenter.updateScore()
                } label: {
                    Text("Next direction")
                        .padding(.all, 20)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(lineWidth: 2))
                }
            }
        }
    }
}

struct GameLevelView_Previews: PreviewProvider {
    static var previews: some View {
        GameLevelView(presenter: GameLevelPresenter(interactor: GameLevelInteractor(directions: [10.0]), router: GameLevelRouter()))
    }
}
