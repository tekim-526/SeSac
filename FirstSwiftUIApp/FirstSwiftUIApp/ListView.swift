//
//  ListView.swift
//  FirstSwiftUIApp
//
//  Created by Kim TaeSoo on 2022/12/19.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            DatePicker(selection: .constant(Date()), label: {Text("Date")})
            Text("1위")
                .font(.caption)
            Text("2위")
                .foregroundColor(.yellow)
                .background(.mint)
            ForEach(1..<51) { i in
                Text("리스트 셀 \(i)위")
                    .foregroundColor(Color.pink)
                    .multilineTextAlignment(.center)
            }
        }
        .listStyle(.plain)
        .font(.largeTitle)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .previewDevice("iPhone 11")
    }
}
