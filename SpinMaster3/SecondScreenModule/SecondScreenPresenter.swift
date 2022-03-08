//
//  SecondScreenPresenter.swift
//  SpinMaster3
//
//  Created by Alexandre G on 04/03/2022.
//

import Foundation
import SwiftUI

final class SecondScreenPresenter: ObservableObject {

    private let interactor: SecondScreenInteractorProtocol
    private let router: SecondScreenRouterProtocol

    init(interactor: SecondScreenInteractorProtocol, router: SecondScreenRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func popToSuperView() {
        router.popToRootController()
    }
}
