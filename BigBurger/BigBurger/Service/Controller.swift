//
//  Controller.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import Combine

class Controller: ObservableObject {

    @Published var burgers: [BurgerEntity]
    @Published var total: String

    var shoppingCartContent : [BurgerEntity]

    init() {
        Logger.log("Controller init")

        burgers = []
        shoppingCartContent = []
        total = "0.00"
    }

    // add remove items from shopping Cart

    func subItem(item: BurgerEntity) -> Bool {

        if shoppingCartContent.filter( {$0.ref == item.ref }).first != nil {
            shoppingCartContent.remove(object: item)

            updateTotal()
            return true
        }
        return false
    }

    func addItem(item: BurgerEntity) {
        shoppingCartContent.append(item)

        updateTotal()
    }

    // update shoppingCart total

    private func updateTotal() {
        var _total = 0
        for burger in shoppingCartContent {
            _total += burger.price
        }
        total = String(format: "%.2f", Double(_total) / 100)
    }

    // burger fetching

    func fetchBurgers(urlString: String) async throws {

        self.burgers  = []
#if DEBUG
        Logger.log("DEBUG using mock datas")

        if let json = Service().getMockBurgersString() {
            Logger.log("Json mockfile")
            Logger.log(json)
            burgers = JSonDecoder.decodeBurgers(jsonString: json)
        }

#else
        Logger.log("RELEASE using Webservice calls")

        Task {
            do {
                let service = Service()
                self.burgers = try await service.fetchBurgersDatas(urlString: urlString)
            } catch {
                Logger.log("FetchingError".localized() + "\(error)")
            }

        }
#endif
    }
}
