//
//  CardView.swift
//  Hike
//
//  Created by Kasthuri Tandavarayane on 2/11/2023.
//

import SwiftUI


struct CardView: View {
    @State private var randomNumber: Int = 1
    @State private var imageNumber: Int = 1
    
    
    func randomImage()
    {
        print("--- BUTTON WAS PRESSED ---")
        print("Status: Old Image Number = \(imageNumber)")
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        }
        while randomNumber == imageNumber
                
                imageNumber = randomNumber
                print("Result: New Image Number = \(imageNumber)")
                print("--- THE END ---")
                print("\n")
    }
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
            VStack{
                
                
                VStack(alignment: .leading){
                    // header
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color.customGrayLight,
                                        Color.customGrayMedium
                                    ],
                                    startPoint: .top, endPoint: .bottom ))
                        Spacer()
                        Button{
                            print("the button was pressed")
                        }label: {
                            CustomButtonView()
                            
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for families and friends")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal,30)
                ZStack {
                    
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                    //each time when the value of this variable changes, then the animation will be executed
                        .animation(.default, value: imageNumber)
                }
                
                
                Button {
                    randomImage()
                }
            label:
                {
                    Text("Explore More")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors:
                                            [.customGreenLight,
                                             .customGreenMedium
                                            ],
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 0.25, x:1, y:2)
                }
                .buttonStyle(GradientButton())
            }
        }
        //card
        .frame(width: 320, height: 570)
        
    }
}

#Preview {
    CardView()
}

