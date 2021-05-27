//
//  GetStarted.swift
//  iosApp
//
//  Created by Martins on 5/25/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct GetStarted: View {
    var body: some View {
        VStack {
            HStack {
                Image("logo")
                    .padding(EdgeInsets(top: 56, leading: 49, bottom: 0, trailing: 0))
                Spacer()
            }
            HStack {
                Text("Food for Everyone")
                    .font(.custom("SFPro-Heavy", size: 65))
                    .foregroundColor(.white)
                    .padding(.top, 31)
                    .padding(.leading, 51)
                Spacer()
            }
            
            ZStack {
                Image("legos")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Get starteed")
                            .frame(width: 314, height: 70, alignment: .center)
                            .foregroundColor(Color("DullRed"))
                            .background(Color.white)
                            .cornerRadius(30)
                    })
                    .padding(.bottom, 36)
                }
            }
            Spacer()
        }
        .background(Color("DullRed"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}
