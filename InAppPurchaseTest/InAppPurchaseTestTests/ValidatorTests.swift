//
//  ValidatorTests.swift
//  InAppPurchaseTestTests
//
//  Created by Kim TaeSoo on 2022/11/30.
//

import XCTest

@testable import InAppPurchaseTest

final class ValidatorTests: XCTestCase {
    var sut: Validator!
    override func setUpWithError() throws {
        sut = Validator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    // 빨리. 고립 (다른 테스트에 영향 X). 항상 같은 결과
    // 네트워크 비동기 테스트 (서버꺼짐 등등)?
    func testValidator_validEmail_returnTrue() throws {
        let user = User(email: "taesu@taesu.com", passsword: "1234", check: "1234")
        let valid = sut.isValidEmail(email: user.email)
        XCTAssertTrue(valid)
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
