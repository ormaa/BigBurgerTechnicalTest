//
//  Service.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation

class Service {

    init() {
        Logger.log("Service init")
    }

    func getMockBurgersString() -> String? {
        do {
            if let path = Bundle.main.path(forResource: "mock", ofType: "json") {
                let json = try String(contentsOfFile: path, encoding: .utf8)
                return json
            } else {
                Logger.log("json file - path not found")
            }
        } catch {
            Logger.log("getMockBurgers - error \(error)")
        }
        return nil
    }

    // get a [BurgerEntity] array from json object (from internet URL String)
    func fetchBurgersDatas(urlString: String) async throws -> [BurgerEntity] {

        guard let url = URL(string: urlString) else { fatalError("Bad URL string") }

        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedBurgers = try JSONDecoder().decode([BurgerEntity].self, from: data)
        Logger.log("Async decodedBurgers count : \(decodedBurgers.count)")

        return decodedBurgers
    }

    // get an image from internet URL String
    func fetchImage(urlString: String) async throws -> Data? {

        guard let url = URL(string: urlString) else { fatalError("Bad URL string") }

        do {
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

            return data
        } catch {
            Logger.log("Error while loading image \(urlString) - \(error)")
        }
        return nil
    }
}
