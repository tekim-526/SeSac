//
//  ViewController.swift
//  InAppPurchaseTest
//
//  Created by Kim TaeSoo on 2022/11/28.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
    // 인앱 상품 ID 정의
    var productIdentifiers: Set<String> = ["com.tekim.Step1.RemoveAd"]
    // 인앱 상품 정보
    var productArray = Array<SKProduct>()
    var product: SKProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestProductData()
        
        
    }
    // productIdentifiers 에 정의된
    func requestProductData() {
        
        if SKPaymentQueue.canMakePayments() {
            print("인앱 결제 가능")
            let request = SKProductsRequest(productIdentifiers: productIdentifiers)
            request.delegate = self
            request.start() //인앱 상품 조회
        } else {
            print("In App Purchase Not Enabled")
        }
        
    }
    
    @IBAction func purchasePuttonTapped(_ sender: Any) {
        //구매시작
        let payment = SKPayment(product: product!)
        SKPaymentQueue.default().add(payment)
        SKPaymentQueue.default().add(self)
    }
    
}

extension ViewController: SKProductsRequestDelegate {
    // 인앱상품 정보 조회
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        let products = response.products
        
        if products.count > 0 {
            
            for i in products {
                productArray.append(i)
                product = i //옵션. 테이블 뷰 셀에서 구매하기 버튼 클릭시
                
                print(i.localizedTitle, i.price, i.priceLocale, i.localizedDescription)
            }
            
        } else {
            print("No Product Found") // 계약 업데이트, 유료계약 X, Capabilities X
        }
    }
    
    // 영수증 검증
    func receiptValidation(transaction: SKPaymentTransaction, productIdentifier: String) {
        // SandBox: “https://sandbox.itunes.apple.com/verifyReceipt”
        // iTunes Store : “https://buy.itunes.apple.com/verifyReceipt”
        
        //구매 영수증 정보
        let receiptFileURL = Bundle.main.appStoreReceiptURL
        let receiptData = try? Data(contentsOf: receiptFileURL!)
        let receiptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        print(receiptString)
        //거래 내역(transaction)을 큐에서 제거
        SKPaymentQueue.default().finishTransaction(transaction)
        
    }
    
}

extension ViewController: SKPaymentTransactionObserver {
    // 구매 성공
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            
            switch transaction.transactionState {
                
            case .purchased: //구매 승인 이후에 영수증 검증
                
                print("Transaction Approved. \(transaction.payment.productIdentifier)")
                receiptValidation(transaction: transaction, productIdentifier: transaction.payment.productIdentifier)
                
            case .failed: //실패 토스트, transaction
                
                print("Transaction Failed")
                SKPaymentQueue.default().finishTransaction(transaction)
                
            default:
                break
            }
        }
    }
    
    // 구매 실패
    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("removedTransactions")
    }
    
}
