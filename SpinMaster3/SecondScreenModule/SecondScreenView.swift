//
//  SecondScreenView.swift
//  SpinMaster3
//
//  Created by Alexandre G on 04/03/2022.
//

import SwiftUI

struct SecondScreenView: View {
    @ObservedObject var presenter: SecondScreenPresenter

    var body: some View {
        VStack{
            Text("Hello, World! 2")

            Button {
                presenter.popToSuperView()
            } label: {
                Text("Pop to superview")
                    .padding(.all, 20)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(lineWidth: 2))
            }
        }

    }
}

struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView(presenter: SecondScreenPresenter(interactor: SecondScreenInteractor(), router: SecondScreenRouter()))
    }
}
