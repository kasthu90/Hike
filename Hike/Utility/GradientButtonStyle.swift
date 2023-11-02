//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Kasthuri Tandavarayane on 2/11/2023.
//

import Foundation
import SwiftUI

// custom button style and here gb is a unique name and button style is a protocol
// creating a new function to build up this button style.

struct GradientButton : ButtonStyle {
    //With this code, we created the skeleton of a custom button style.
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                configuration.isPressed ?
                // when th user press the button
                LinearGradient(colors:
                                [.customGrayLight, .customGrayMedium],
                               startPoint: .top, endPoint: .bottom )
                :
                    // when the user not pressed the button
                LinearGradient(colors:
                                [.customGrayMedium, .customGrayLight],
                               startPoint: .top, endPoint: .bottom )
            ).cornerRadius(40)
    }
}
