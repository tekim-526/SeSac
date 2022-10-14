//
//  LottoViewModel.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/09/01.
//

import Foundation

class LottoViewModel {
    var number1 = Observable(1)
    var number2 = Observable(2)
    var number3 = Observable(3)
    var number4 = Observable(4)
    var number5 = Observable(5)
    var number6 = Observable(6)
    var number7 = Observable(7)
    var lottoMoney = Observable("당첨금")
   
    func format(for number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: number) ?? "0"
    }
    
    
    func fetchLottoAPI(drwNo: Int) {
        LottoAPIManager.requestLotto(drwno: drwNo) { lotto, error in
            guard let lotto else { return }
            self.number1.value = lotto.drwtNo1
            self.number2.value = lotto.drwtNo2
            self.number3.value = lotto.drwtNo3
            self.number4.value = lotto.drwtNo4
            self.number5.value = lotto.drwtNo5
            self.number6.value = lotto.drwtNo6
            self.number7.value = lotto.bnusNo
            self.lottoMoney.value = self.format(for: lotto.totSellamnt)
        }
    }
}
