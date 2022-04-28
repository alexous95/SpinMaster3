//
//  SecondScreenView.swift
//  SpinMaster3
//
//  Created by Alexandre G on 04/03/2022.
//

import SwiftUI

struct SecondScreenView: View {
    @ObservedObject var presenter: SecondScreenPresenter

    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.red, .black],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                VStack{
                    Text("Hello, World! 2")
                        .foregroundColor(.white)

                    Spacer()

                    Button {
                        presenter.popToSuperView()
                    } label: {
                        Text("Pop to superview")
                            .padding(.all, 20)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(lineWidth: 2))
                    }
                }
                .navigationBarTitle("Test", displayMode: .automatic)
            }
        }
    }
}

struct SecondScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenView(presenter: SecondScreenPresenter(interactor: SecondScreenInteractor(), router: SecondScreenRouter()))
    }
}
