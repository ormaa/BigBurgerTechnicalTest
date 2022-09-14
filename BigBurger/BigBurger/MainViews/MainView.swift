//
//  MainView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import SwiftUI

struct MainView: View {
    let catalogURLString = "https://bigburger.useradgents.com/catalog"

    // this padding force the scrollView padding on bottom of screen ( VStack / ScrollView inside a ZStack)
    let bottomPadding = 50.0

    // this will start display of shopping Cart content
    @State private var willMoveToNextScreen = false

    @ObservedObject var controller: Controller = Controller()

    init() {
        Logger.log("MainView init")
    }

    var body: some View {

        GeometryReader { reader in
            ZStack(alignment: .top) {

                // header with total and display shopping cart button
                CatalogHeaderViewView(controller: controller)
                    .position(x: reader.size.width - 30, y: 50)

                // display the burger list
                BurgerListView(controller: controller)
                    .offset(y: 80)
                    .padding(.bottom, bottomPadding)

                // funny sliding text ( just for fun )
                SlidingAnimationView()
                    .zIndex(1)
                    .offset(x: 0, y: reader.size.height - 20)
            }
            .padding(.bottom, bottomPadding)
            // request the burger list catalog
            .task {
                do {
                    try await controller.fetchBurgers(urlString: "https://bigburger.useradgents.com/catalog")
                } catch {
                    Logger.log("FetchingError".localized() + "\(error)")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
