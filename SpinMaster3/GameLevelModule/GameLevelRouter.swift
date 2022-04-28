//
//  GameLevelRouter.swift
//  SpinMaster3
//
//  Created by Alexandre G on 02/03/2022.
//

import Foundation
import SwiftUI
import UIKit

protocol GameLevelRouterProtocol: AnyObject {
    func presentSecondView()
}

final class GameLevelRouter {
    var navigationController: UINavigationController?

    func associatedView() -> AnyView {
        typealias View = GameLevelView
        typealias Presenter = GameLevelPresenter
        typealias Interactor = GameLevelInteractor

        let interactor = Interactor(directions: [10.0, 20.0, 30.0])
        let presenter = Presenter(interactor: interactor, router: self)
        let view = View(presenter: presenter)

        return AnyView(view)
    }
}

extension GameLevelRouter: GameLevelRouterProtocol {
    func presentSecondView() {
        let nextRouter = SecondScreenRouter()
        let nextView = nextRouter.associatedView()
        let nextController = UIHostingController(rootView: nextView)
        nextRouter.navigationController = navigationController
        navigationController?.pushViewController(nextController, animated: true)
        navigationController?.navigationBar.isHidden = true
    }

}
