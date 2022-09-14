//
//  ShoppingCartView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import SwiftUI

struct ShopingCartView: View {

    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var controller: Controller

    var body: some View {

        VStack {

            Text("ShopingCartTitle".localized())
                .font(.title)

            Text("Total : \(controller.total) €")
                .font(.body)
                .padding(.leading, 8)

            HStack {
                Text("ClickToStartPaiement".localized())
                    .font(.caption)

                Image(systemName: "creditcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 96)
            }
            .padding(.top, 16)

            Spacer()

            Text("Order content")
                .font(.caption)

            ScrollView {
                ForEach(controller.shoppingCartContent, id: \.self) { burger in
                    ShoppingCartCellView(burger: burger)
                }
            }
            .padding(.top, 16)

            Spacer()

        }
        .offset(x: 0, y: 100)
        .overlay(
            closeBar(presentationMode: presentationMode)
        )

    }

    struct closeBar: View {

        var presentationMode: Binding<PresentationMode>

        var body: some View {

            HStack(alignment: .top) {
                Button {
                    // dismiss view
                    presentationMode.wrappedValue.dismiss()
                } label:  {
                    Image(systemName: "multiply")
                        .resizable()
                        .frame(width: 24, height: 24)

                    Text("ShoppingCancelBtnTitle".localized())
                        .padding(.leading, 8)
                }
            }
            .frame(height: 32)
            .padding(16)
            .position(x: 50, y: 30)

        }
    }
}
