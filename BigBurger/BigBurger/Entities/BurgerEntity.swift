//
//  BurgerEntity.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation

class BurgerEntity : Codable, ObservableObject, Identifiable {

    let ref: String
    var title: String
    let description: String
    let thumbnail: String
    let price: Int

    var getPriceInEuro: String {
        return String(format: "%.2f €", Double(price) / 100)
    }
}

extension BurgerEntity: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(ref)
    }

    static func == (lhs: BurgerEntity, rhs: BurgerEntity) -> Bool {
        (lhs.ref == rhs.ref &&
         lhs.ref == rhs.ref &&
         lhs.title == rhs.title &&
         lhs.description == rhs.description &&
         lhs.thumbnail == rhs.thumbnail &&
         lhs.price == rhs.price)
    }

}
