//
//  ContentView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var willMoveToNextScreen = false


    var body: some View {
        VStack {
            Spacer()
            Text("MainViewtitle".localized())
                .font(.largeTitle)
            Spacer(minLength: 8)

            Image("burger")
                .resizable()
                .frame(width: 128, height: 128)

            Spacer(minLength: 8)
            Text("🙃")
                .font(.largeTitle)
            Spacer()
        }
        .navigate(to: MainView(), when: $willMoveToNextScreen)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.willMoveToNextScreen = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
