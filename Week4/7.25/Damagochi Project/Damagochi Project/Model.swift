//
//  Model.swift
//  Damagochi Project
//
//  Created by Kim TaeSoo on 2022/07/22.
//

import UIKit

enum Damagochi: Int, CaseIterable {
    case green = 1
    case orange
    case pink
    
    var imageAsset: UIImage? {
        switch self {
        case .green: return UIImage(named: "\(Damagochi.green.rawValue)-6")
        case .orange: return UIImage(named: "\(Damagochi.orange.rawValue)-6")
        case .pink: return UIImage(named: "\(Damagochi.pink.rawValue)-6")
        }
    }
    var damagochiName: String {
        switch self {
        case .green: return "초록 다마고치"
        case .orange: return "주황 다마고치"
        case .pink: return "핑크 다마고치"
        }
    }
}

enum TableViewEnum: Int {
    case rename, change, reset
}

struct Model {
    var backGroundColor: UIColor = UIColor(red: 246/255, green: 252/255, blue: 252/255, alpha: 1)
    var buttonColor: UIColor = UIColor(red: 77/355, green: 106/255, blue: 120/255, alpha: 1)
    var textColor: UIColor = UIColor(red: 78/255, green: 100/255, blue: 111/255, alpha: 1)
    var labelButtonColor: UIColor = UIColor(red: 240/255, green: 249/255, blue: 249/255, alpha: 1)
    
    let mentionArray = [
        "안녕하세요 저는 다마고치에요",
        "오늘 코딩은 하셨나요?",
        "일어나세요 공부하셔야죠",
        "피곤해도 참으세요",
        "엑스코드 에러가 짜증나시나요?\n껏켯하세요.",
        "과제하느라 고생했어요",
        "블로그 포스팅 하셨나요?",
        "건들지 마세요",
        "힘든건 다 똑같아요",
        "백업 하셨나요?",
        "저보다 고양이가 더 좋다구요?\n'ㅅ'",
        "가지가지 나뭇가지하네",
        "한강뷰 가즈아",
        "차트가 파란색인가요?\n저도 슬프네요",
        "잠은 죽어서 주무세요"
    ]
    let descriptionArray = [
        "안녕하세요 저는 초록 다마고치에요.\n고슴도치 같아보이지만 선인장이랍니다.\n저는 물마시는걸 좋아해요",
        "안녕하세요 저는 주황 다마고치에요.\n민머리 같아보이지만 머리카락이 있답니다.\n저는 밥을 좋아해요",
        "안녕하세요 저는 주황 다마고치에요.\n찌그러져 있지만 크면 각이 생긴답니다.\n저는 다 좋아해요"
    ]
    
    func boxedNameLabelUI(label: UILabel) {
        label.textColor = textColor
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 3
    }
}


