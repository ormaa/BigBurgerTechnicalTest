//
//  ImageDownloader.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import UIKit

class ImageDownloader: ObservableObject {

    @Published var image: UIImage

    init() {
        Logger.log("ImageDownloader init")

        image = UIImage()
    }

    func fetchImage(urlString: String) {
#if DEBUG
        self.image = UIImage(imageLiteralResourceName: "burger")
#else
        donwloadImage(urlString: "https://www.fine-s.fr/9959/test.jpg")
#endif
    }

    func donwloadImage(urlString: String) {
        Task {
            if let data = try? await Service().fetchImage(urlString: urlString),
               let image = UIImage(data: data) {
                self.image = image
            }
        }
    }

}
