//
//  SecondScreenRouter.swift
//  SpinMaster3
//
//  Created by Alexandre G on 04/03/2022.
//

import Foundation
import UIKit
import SwiftUI

protocol SecondScreenRouterProtocol: AnyObject {
    func popToRootController()
}

final class SecondScreenRouter {
    var navigationController: UINavigationController?

    func associatedView() -> AnyView {
        typealias View = SecondScreenView
        typealias Presenter = SecondScreenPresenter
        typealias Interactor = SecondScreenInteractor
        typealias Router = SecondScreenRouter

        let interactor = Interactor()
        let presenter = Presenter(interactor: interactor, router: self)
        let view = View(presenter: presenter)

        return AnyView(view)
    }
}

extension SecondScreenRouter: SecondScreenRouterProtocol {
    func popToRootController() {
        navigationController?.popViewController(animated: true)
    }
}
