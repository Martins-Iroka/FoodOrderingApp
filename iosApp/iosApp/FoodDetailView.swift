//
//  FoodDetailView.swift
//  iosApp
//
//  Created by Martins on 5/26/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct FoodDetailView: View {
    
    @State var rotate = false
    var body: some View {
        VStack {
            HStack {
               
                
                Spacer()
                
                Image("heart")
            }
            .padding(EdgeInsets(top: 50, leading: 24, bottom: 0, trailing: 24))
            
            
                Image("foodie")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center)
                    .padding(.top, 10)
          
               
            
            Text("Veggie tomato mix")
                .font(.system(size: 28))
                .foregroundColor(.black)
                .fontWeight(.semibold)
            
            Text("N1,900")
                .font(.system(size: 22))
                .foregroundColor(Color("Red2"))
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("Delivery info")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .frame(width: 267, alignment: .leading)
                .padding(.top, 43)
            
            Text("Delivered between monday aug and thursday 20 from 8pm to 91:32 pm")
                .frame(width: 267, alignment: .leading)
                .font(.system(size: 15))
                .foregroundColor(Color("Black2"))
                .padding(.top, 1)
            
            Text("Return policy")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .frame(width: 267, alignment: .leading)
                .padding(.top, 43)
            
            Text("All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.")
                .frame(width: 297, alignment: .leading)
                .font(.system(size: 15))
                .foregroundColor(Color("Black2"))
                .padding(.top, 1)
                .padding(.leading, 30)
            
            GenericButton(name: "Add to cart") {
                
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .background(Color("Grey"))
        .edgesIgnoringSafeArea(.all)
        .animation(.easeIn)
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView()
    }
}
