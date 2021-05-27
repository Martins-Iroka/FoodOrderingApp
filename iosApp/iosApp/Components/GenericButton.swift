//
//  GenericButton.swift
//  iosApp
//
//  Created by TellerOne on 5/27/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct GenericButton: View {
    
    let name: String
    let performAction: () -> ()
    var body: some View {
        Button(action: performAction, label: {
            Text(name)
                .frame(width: 314, height: 70, alignment: .center)
                .font(.system(size: 17))
                .foregroundColor(Color("Grey2"))
                .background(Color("Red2"))
                .cornerRadius(30)
        })
    }
}
