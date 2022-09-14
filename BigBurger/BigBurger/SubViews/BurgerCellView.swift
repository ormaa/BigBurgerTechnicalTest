//
//  BurgerCellView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import SwiftUI

struct BurgerCellView: View {

    var burger: Binding<BurgerEntity>

    @ObservedObject var controller: Controller
    @ObservedObject var imageDownloader: ImageDownloader = ImageDownloader()

    // this Binding will fire value when item is added or removed
    @Binding var itemRemoved: Bool
    @Binding var itemAdded: Bool

    init(burger: BurgerEntity,
         itemRemoved: Binding<Bool>,
         itemAdded: Binding<Bool>,
         controller: Controller) {

        self.burger = Binding(
            get: { burger },
            set: { _ in  }
        )

        self._itemRemoved = itemRemoved
        self._itemAdded = itemAdded

        self.controller = controller
        self.imageDownloader.fetchImage(urlString: burger.thumbnail)
    }

    var body: some View {

        HStack(spacing: 0) {

            Image(uiImage: imageDownloader.image)
                .resizable()
                .frame(width: 48, height: 48)

            VStack(alignment: .leading) {
                Text("\(burger.wrappedValue.title)")
                    .font(.system(size: 14, weight: .bold, design: .default))

                Text("\(burger.wrappedValue.description)")
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .font(.caption)

            }
            .padding(.leading, 8)

            Spacer()

            VStack(spacing: 4) {

                Text("\(burger.wrappedValue.getPriceInEuro)")
                    .font(.system(size: 14, weight: .regular, design: .default).italic())

                HStack(spacing: 0) {
                    Button(action: {
                        if controller.subItem(item: burger.wrappedValue) {
                            itemRemoved = true
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(0)
                            .frame(width: 32, height: 32)
                    }

                    Button(action: {
                        controller.addItem(item: burger.wrappedValue)
                        itemAdded = true
                    }) {

                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    .padding(.horizontal, 8)
                }
            }

        }
    }

}
