//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Kim TaeSoo on 2022/12/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("안녕하세요")
        }
        .padding()
        .border(.red)
        .padding()
        .border(.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
