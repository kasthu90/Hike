//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Kasthuri Tandavarayane on 2/11/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    // properties
    @State private var randomCircle: Int = Int.random(in: (6...12))
    @State private var isAnimating: Bool = false
    // functions
    // 1. Random coordinate
    //if we want to declare a precise position of any view in swift UI, then we must use CG floating points for the x and Y coordinates.
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    //  2. Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    //3. random scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //4. random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    //5. Random delay
    
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    var body: some View {
        
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear (
                        perform: {
                            withAnimation(
                                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            )
                            {
                                isAnimating = true
                            }
                        })
                
            }
        }
        .frame(width: 256, height: 256)
        // animation circle is going outside of the shape, so adding mask here
        .mask(Circle())
       // High performance rendering -  new modifier enables high performance metal rendering.
        .drawingGroup()
    }
}


#Preview {
    MotionAnimationView()
      .background(
        Circle()
          .fill(.teal)
      )
    
}
