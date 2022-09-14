//
//  BurgerListView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import SwiftUI

// display the burger list

struct BurgerListView: View {

    @ObservedObject var controller: Controller

    // used to display "Toast" text when item is added or removed from shopping Cart
    @State var itemAdded = false
    @State var itemRemoved = false

    var body: some View {

        // create a 2 ways binding
        let bindingAdded = Binding(
            get: { self.itemAdded },
            set: { self.itemAdded = $0 }
        )
        let bindingRemoved = Binding(
            get: { self.itemRemoved },
            set: { self.itemRemoved = $0 }
        )

        VStack {

            Text("MainViewtitle".localized())
                .font(.title)

            Image("burger")
                .resizable()
                .frame(width: 64, height: 64)

            Text("AvailableBurgers".localized() + "\(controller.burgers.count)")
                .font(.caption)
                .padding(.top, 16)

            // display the burger list
            ScrollView {
                ForEach(controller.burgers, id: \.self) { burger in
                    BurgerCellView(burger: burger,
                                   itemRemoved: bindingRemoved,
                                   itemAdded: bindingAdded,
                                   controller: controller)
                }
            }
            .padding(.horizontal, 4)
            .padding(.top, 16)

        }
    }
}
