//
//  ExampleView.swift
//  FirstSwiftUIApp
//
//  Created by Kim TaeSoo on 2022/12/19.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
            Spacer()
            Circle()
            Ellipse()
                .fill(.yellow)
            Rectangle()
                .fill(.mint)
            Spacer()
            Text("안녕하세요\n안녕하세요\n안녕하세요")
                .underline()
                .strikethrough()
                .lineLimit(2)
                .kerning(10)
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
            .previewDevice("iPhone 11")
    }
}
