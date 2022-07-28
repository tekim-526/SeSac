import UIKit

struct ExchangeRate {
    var currencyRate: Double = 0 {
        willSet {
            print("currencyRate willSet - 환율 변동 예정 \(currencyRate) -> \(newValue)")
        }
        didSet {
            print("currencyRate didSet - 환율 변동 완료 \(oldValue) -> \(currencyRate)")
        }
    }
    var KRW: Double = 0 {
        willSet {
            print("USD willSet - 환전금액 USD : \(newValue / currencyRate)달러로 환전예정")
        }
        didSet {
            print("USD didSet - KRW: \(KRW)원 -> \(KRW / currencyRate)달러로 환전 되었음")
        }
    }
    var USD: Double {
        get {
            return KRW / currencyRate
        }
        set {
            KRW = newValue * currencyRate
        }
    }
    
}

var rate = ExchangeRate(currencyRate: 1100, KRW: 500000)
rate.KRW = 500000
rate.currencyRate = 1350
rate.KRW = 500000
rate.USD
rate.USD = 1
rate.KRW
