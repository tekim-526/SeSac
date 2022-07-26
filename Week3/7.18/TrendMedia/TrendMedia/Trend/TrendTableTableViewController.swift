//
//  TrendTableTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/21.
//

import UIKit

class TrendTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func movieButtonTapped(_ sender: UIButton) {
        // MARK: - 화면전환: 1. 스토리보드 파일 찾기(가져오기), 2. 스토리보드 내에 뷰컨트롤러 찾기(가져오기), 3. 화면 전환
        // 영화 버튼 클릭 >  BucketListTableViewController Present
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        // 3.
        vc.textFieldPlaceHolder = "영화"
        self.present(vc, animated: true)
    }
    @IBAction func dramaButtonTapped(_ sender: UIButton) {
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        // 2.5. present 시 화면 전환 방식 설정(옵션)
        vc.modalPresentationStyle = .fullScreen
        // 3.
        vc.textFieldPlaceHolder = "드라마"
        self.present(vc, animated: true)
    }
    @IBAction func bookButtonTapped(_ sender: UIButton) {
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        vc.textFieldPlaceHolder = "책"
        // 2.5 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)

        // 2.5. present 시 화면 전환 방식 설정(옵션)
        nav.modalPresentationStyle = .fullScreen
        // 3.
        
        self.present(nav, animated: true)
        
    }
    

}
