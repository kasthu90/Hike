//
//  CustomCircleView.swift
//  Hike
//
//  Created by Kasthuri Tandavarayane on 2/11/2023.
//

import SwiftUI

struct CustomCircleView: View {
    // once the circle appears only need to start animation, so setting it to false.
    
    @State private var isAnimated: Bool = false
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [
                        .customIndigoMedium,
                        .customSalmonLight],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
            .onAppear()
        {
            withAnimation() {
                isAnimated.toggle()
            }
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
