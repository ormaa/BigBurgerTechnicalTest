//
//  ShopingCartView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import SwiftUI

struct ShoppingCartCellView: View {

    var burger: Binding<BurgerEntity>

    @ObservedObject var imageDownloader: ImageDownloader = ImageDownloader()

    init(burger: BurgerEntity) {

        self.burger = Binding(
            get: { burger },
            set: { _ in  }
        )

        self.imageDownloader.fetchImage(urlString: burger.thumbnail)

        Logger.log(burger.title)
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

            Text("\(burger.wrappedValue.getPriceInEuro)")
                .font(.system(size: 14, weight: .regular, design: .default).italic())
                .padding(.leading, 16)

            Spacer()
        }
    }

}
