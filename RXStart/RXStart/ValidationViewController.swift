//
//  ValidationViewController.swift
//  RXStart
//
//  Created by Kim TaeSoo on 2022/10/27.
//

import UIKit

import RxCocoa
import RxSwift

class ValidationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var stepButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    let viewModel = ValidationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        observableVSSubject()
    }
    
    
    func bind() {
        let input = ValidationViewModel.Input(text: nameTextField.rx.text, tap: stepButton.rx.tap)
        let output = viewModel.transform(input: input)
/* ****************************************************************************************************/
        
        output.validation
            .bind(to: stepButton.rx.isEnabled, validationLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        let validation = nameTextField.rx.text
            .orEmpty
            .map { $0.count >= 8 }
            .share()
        
        validation
            .bind(to: stepButton.rx.isEnabled, validationLabel.rx.isHidden)
        //            .bind(onNext: { value in
        //                self.stepButton.isEnabled = value
        //                self.validationLabel.isHidden = value
        //            })
            .disposed(by: disposeBag)
        
        output.validation
            .bind { value in
                let color: UIColor = value ? .systemPink : .systemMint
                self.stepButton.backgroundColor = color
            }.disposed(by: disposeBag)
        
        
/* ****************************************************************************************************/

        viewModel.validText // VM -> VC (Output)
            .asDriver()
            .drive(validationLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.text
            .drive(validationLabel.rx.text)
            .disposed(by: disposeBag)

        output.tap
            .bind { _ in
                print("Show Alert")
            }.disposed(by: disposeBag)
        
        stepButton.rx.tap
            .bind { _ in
                print("SHOW ALERT")
            }.disposed(by: disposeBag)
/* ****************************************************************************************************/

        

        
        
        
    }
    
    func observableVSSubject() {
        
        let testA = stepButton.rx.tap
            .map { "\(Int.random(in: 1...100))" }
            .asDriver(onErrorJustReturn: "")
        
        testA
            .drive(validationLabel.rx.text)
            //.bind(to: validationLabel.rx.text)
            .disposed(by: disposeBag)
        testA
            .drive(nameTextField.rx.text)
            //.bind(to: nameTextField.rx.text)
            .disposed(by: disposeBag)
        
        testA
            .drive(stepButton.rx.title())
            //.bind(to: stepButton.rx.title())
            .disposed(by: disposeBag)
        
        // 스트림(리소스)을 공유하지않음
        let sampleInt = Observable<Int>.create { observer in
            observer.onNext(Int.random(in: 1...100))
            return Disposables.create()
        }
        
        sampleInt.subscribe { value in
            print("sampleInt : \(value)")
        }.disposed(by: disposeBag)
        
        sampleInt.subscribe { value in
            print("sampleInt : \(value)")
        }.disposed(by: disposeBag)
        
        sampleInt.subscribe { value in
            print("sampleInt : \(value)")
        }.disposed(by: disposeBag)
        
        // 스트림(리소스)을 공유함
        let subjectInt = BehaviorSubject(value: 0)
        subjectInt.onNext(Int.random(in: 1...100))

        subjectInt.subscribe { value in
            print("subjectInt : \(value)")
        }.disposed(by: disposeBag)
        
        subjectInt.subscribe { value in
            print("subjectInt : \(value)")
        }.disposed(by: disposeBag)
        
        subjectInt.subscribe { value in
            print("subjectInt : \(value)")
        }.disposed(by: disposeBag)
    }

    
}
