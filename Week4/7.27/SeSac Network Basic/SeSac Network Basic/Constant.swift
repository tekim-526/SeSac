//
//  Constant.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/08/01.
//

import Foundation

//enum StoryboardName {
//    case Main
//    case Search
//    case Setting
//}

//struct StoryboardName {
//    static let main = "Main"
//    static let search = "Search"
//    static let setting = "Setting"
//
//    // 접근제어를 통해 초기화 방지
//    private init () { }
//}


enum StoryboardName {
    // 인스턴스를 통해 접근하는게 아니기 떄문에 접근 가능
    
    static let main = "Main"
    static let search = "Search"
    static let setting = "Setting"
    
}

/*
 1. struct type property vs enum type property -> 인스턴스 생성 방지
 2. enum case vs enum static => case의 원시값은 고유한 값이어야함 static을 사용하면 중복된 내용 사용 가능

 */

enum FontName: String {
    case title = "font"
    case body = "font0"
    case caption = "caption"
}
