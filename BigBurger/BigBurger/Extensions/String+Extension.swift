//
//  String+Extension.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation


extension String {

    func localized() -> String {
        NSLocalizedString(self, comment: self)
    }
}
