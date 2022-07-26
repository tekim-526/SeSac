//
//  TrendSearchTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

class TrendSearchTableViewController: UITableViewController {

    var movieList = MovieInfo()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음", style: .plain, target: self, action: #selector(resetButtonTapped))
    }
    
    // 앱을 처음화면으로 돌아가기
    @objc func resetButtonTapped() {
        // iOS 13+ SceneDelegate 쓸 때 동작하는 코드
        
        // 1. 앱을 처음 킨 상태처럼 처음부터 실행하겠다는 의미 (어플리케이션 재실행)
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        
        // 2. SceneDelegate 클래스에 접근
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        // 3. 원하는 뷰 컨트롤러로 재실행 -> 쌓여있던 뷰들 다 메모리에서 내려가고 재실행
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendSearchTableViewCell", for: indexPath) as! TrendSearchTableViewCell
        cell.configureCell(data: movieList.movie[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 8
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // present말고 push
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewController") as! RecommandCollectionViewController
        // 2. 값 전달
        vc.movieData = movieList.movie[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
