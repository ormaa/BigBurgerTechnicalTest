//
//  Logger.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation

class Logger {

    static func log(_ message: String?) {

        if let message = message {
            print("\(Date()) - \(message)")
        } else {
            print(Date.now)
        }
    }
}
