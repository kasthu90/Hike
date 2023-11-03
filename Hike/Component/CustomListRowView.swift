//
//  CustomListRowView.swift
//  Hike
//
//  Created by Kasthuri Tandavarayane on 3/11/2023.
//

import SwiftUI

struct CustomListRowView: View {
    //Properties
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    // the nil, is a special value that cannot be assigned to a variable, only to an optional.It means this property has no value at all by default.
    
    var body: some View {
        LabeledContent{
            //content
            if rowContent != nil{
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkLabel != nil && rowLinkDestination != nil){
                //Two exclamation marks - It means that if both the link label and link destination have some sort of string content, then a swift UI link will be presented in the list row.
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        }
        
    label:
        {
            //label
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    
    List{
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https://credo.academy"
        )
    }
    
}
