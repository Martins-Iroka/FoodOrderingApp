//
//  RadioButtonField.swift
//  iosApp
//
//  Created by Martins on 5/27/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

//MARK:- Radio Button Field
struct RadioButtonField: View {
    let id: Int
    let label: String
    let isMarked: Bool
    let showImage: Bool
    let imageName: String
    let callback: (Int) -> ()
    
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .clipShape(Circle())
                    .foregroundColor(self.isMarked ? Color("Red2") : Color(hex: "#9F9F9F"))
                
                if showImage {
                    Image(imageName)
                }
                Text(label)
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                Spacer()
            }
        }
    }
}
