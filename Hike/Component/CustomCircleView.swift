//
//  CustomCircleView.swift
//  Hike
//
//  Created by Kasthuri Tandavarayane on 2/11/2023.
//

import SwiftUI

struct CustomCircleView: View {
    // once the circle appears only need to start animation, so setting it to false.
    
    @State private var isAnimateGradient: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight],
                        startPoint: isAnimateGradient ?.topLeading: .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    ))
                .onAppear()
            {
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses:true)) {
                    isAnimateGradient.toggle()
                }
            }
            MotionAnimationView()
        }.frame(width: 256, height: 256)
           
        
    }
}

#Preview {
    CustomCircleView()
}
