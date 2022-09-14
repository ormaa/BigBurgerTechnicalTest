//
//  SlidingAnimationView.swift
//  BigBurger
//
//  Created by olivier robin on 14/09/2022.
//

import Foundation
import SwiftUI

struct SlidingAnimationView: View {

    @State private var startAnimation = false

    private let funnyText = "Le gras c'est la vie 🙃"

    var body: some View {
        //     GeometryReader { proxy in
        VStack(spacing: 0) {
            if startAnimation {
                Text(funnyText)
                    .font(.title)
                    .transition(.move(edge: .leading))
                // i see the deprecation, but using the new syntax, it break the animation :
                // it need more investigation to fix that.
                    .animation(Animation.linear(duration: 1.5).repeatForever())
                // this position allow to have the text sliding from left to right
                // and go outside the screen
                    .position(x: UIScreen.main.bounds.width, y: 16)
            }
        }
        .frame(width: 370)
        .onAppear {

            //   let animation = Animation.default(duration: 2)
            let animation = Animation.default // .repeatCount(1000, autoreverses: true)
            //       DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(animation) {
                self.startAnimation.toggle()
                //         }
            }
        }
    }
}
