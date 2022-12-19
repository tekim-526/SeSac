//
//  InAppPurchaseTestTests.swift
//  InAppPurchaseTestTests
//
//  Created by Kim TaeSoo on 2022/11/29.
//

import XCTest

@testable import InAppPurchaseTest

final class InAppPurchaseTestTests: XCTestCase {

    var sut: LoginViewController! // system under test 테스트하고자 하는 클래스를 정의할때 사용
    
    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    
    // 이메일 유효성 테스트
    func testLoginViewController_validEmail_returnTrue() throws {
        // 테스트 객체 Given, Arrange
        sut.emailTextField.text = "taesu@taesu.com"
        
        // 테스트 조건 행동 When Act
        let valid = sut.isValidEmail()
        // 테스트 결과: Then, Assert
        XCTAssertTrue(valid)
    }
    
    func testLoginViewController_invalidPassword_returnFalse() {
        sut.passwordTextField.text = "1234"
        let isValid = sut.isValidPassword()
        XCTAssertFalse(isValid)
    }
    
    func testLoginViewController_emailPassword_returnNil() {
        sut.emailTextField = nil
        let value = sut.emailTextField
        XCTAssertNil(value)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
