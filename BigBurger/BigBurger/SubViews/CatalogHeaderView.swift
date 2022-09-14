//
//  CatalogHeaderView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import SwiftUI

// header with total and display shopping cart button

struct CatalogHeaderViewView: View {

    @ObservedObject var controller: Controller

    @State private var displayBasket = false

    var body: some View {

        HStack {
            Image("cart")
                .resizable()
                .frame(width: 32, height: 32)

            Text("Total")
                .font(.body)
                .padding(.leading, 8)
            Text("\(controller.total) €")
                .font(.body)
                .padding(.leading, 8)
                .frame(width: 80)

            Button(action: {
                displayBasket = true
            }) {
                Image(systemName: "eye")
            }

            Spacer(minLength: 8)
        }
        .frame(height: 32)
//        .sheet(isPresented: $displayBasket) {
//            ShopingCartView(controller: controller)
//        }
    }
}
