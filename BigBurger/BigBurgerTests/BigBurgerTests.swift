//
//  BigBurgerTests.swift
//  BigBurgerTests
//
//  Created by olivier robin on 14/09/2022.
//

import XCTest
@testable import BigBurger

class BigBurgerTests: XCTestCase {

    //    override func setUpWithError() throws {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //    }
    //
    //    override func tearDownWithError() throws {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }

    func testDecodeBurgers() throws {

        let service = Service()

        if let mockJson = service.getMockBurgersString() {
            let burgers = JSonDecoder.decodeBurgers(jsonString: mockJson)
            XCTAssert(burgers.count == 13)
            Logger.log("UnitTest decodeBurgers ok")
        } else {
            XCTAssertThrowsError("Cannot decode json")
        }


    }

    func testImageDownloader() {

        let imageDownloader = ImageDownloader()

        let expectation = self.expectation(description: "Download")

        // this image is 640, 562 ( size )
        imageDownloader.donwloadImage(urlString: "https://www.fine-s.fr/9959/test.jpg")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.5, handler: nil)

        XCTAssert(imageDownloader.image.size.width == 640)
        Logger.log("downloadImage ok")

    }
}
