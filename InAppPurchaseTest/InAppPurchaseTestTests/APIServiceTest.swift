//
//  APIServiceTest.swift
//  InAppPurchaseTestTests
//
//  Created by Kim TaeSoo on 2022/12/01.
//

import XCTest
@testable import InAppPurchaseTest
final class APIServiceTest: XCTestCase {

    var sut: APIService!
    
    override func setUpWithError() throws {
        sut = APIService()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        print("testExample Start")
        sut.number = 100
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("CallRequest")
        }
        print("testExample End")
      
    }
    // 비동기 expectation, fulfill, wait
    /*
     네트워크: 아이폰 네트워크 응답X, API서버 점검, API지연..? >>
     효율적/속도/같은 조건에서 테스트를 해야 하는데 그 조건 깨짐.
     테스트 대상이 외부격리X >> 예측 불가능한 상황을 만들면 안돼!
     => 실제 네트워크 동작이 되는 것 처럼 보이게 별개의 객체를 만듬
     => 테스트 더블(Test Double): 테스트 코드랑 상호작용 할 수 있는 가짜 객체 생성 (ex. 스턴트맨)
            ex. Dummy, mock, fake, stub, spy...
     */
    func test_APILottoREsponse_AsyncCover() throws {
        print("testExample Start")
        let promise = expectation(description: "Waiting lottoNumber, completion handler invoked")
        sut.number = 33
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("CallRequest")
            promise.fulfill() // expectation으로 정의된 테스트 조건을 충족
        }
        wait(for: [promise], timeout: 5)
        print("testExample End")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
