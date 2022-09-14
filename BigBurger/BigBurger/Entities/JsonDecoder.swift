//
//  JsonDecoder.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation

class JSonDecoder {

    static func decodeBurger(jsonString: String) -> BurgerEntity? {
        do {
            let data = Data(jsonString.utf8)
            return try JSONDecoder().decode(BurgerEntity.self, from: data)
        } catch let error {
            Logger.log("Cannot decode json  : \(error)")
        }
        return nil
    }

    static func decodeBurgers(jsonString: String) -> [BurgerEntity] {
        do {
            let data = Data(jsonString.utf8)
            return try JSONDecoder().decode([BurgerEntity].self, from: data)
        } catch let error {
            Logger.log("Cannot decode json string : \(error)")
        }

        return []
    }
}
