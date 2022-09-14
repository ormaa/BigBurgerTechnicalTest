//
//  Array+Extension.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation

extension Array where Element: Equatable {

    // Remove first element equal to object:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
