//
//  CheckoutView.swift
//  iosApp
//
//  Created by TellerOne on 5/27/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @State var selectedItem1 = 1
    @State var selectedItem2 = 1
    @State var shouldShowPayment = false
    
    var body: some View {
        VStack {
            HStack {
                Image("arrow_left")
                    .offset(x: 41.0, y: 0.0)
                
                Spacer()
                
                Text("Checkout")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.top, 60)
            
            Text(shouldShowPayment ? "Payment" : "Delivery")
                .font(.system(size: 34))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
                .padding(.top, 42)
            
            if shouldShowPayment {
                showPayment()
            } else {
                showAddress()
            }
            
            Text("Delivery method")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 56)
                .padding(.top, 42)
  
            VStack {
                Spacer()
                
                RadioButtonField(id: 1,
                                 label: "Door delivery",
                                 isMarked: $selectedItem1.wrappedValue == 1 ? true : false,
                                 showImage: false,
                                 imageName: "") { selected in
                    self.selectedItem1 = selected
                }
                .padding(.leading, 21)
                
                Spacer()
                
                Capsule()
                    .frame(width: 220, height: 0.5, alignment: .center)
                
                Spacer()
                
                RadioButtonField(id: 2,
                                 label: "Pick up",
                                 isMarked: $selectedItem1.wrappedValue == 2 ? true : false,
                                 showImage: false,
                                 imageName: "") { selected in
                    self.selectedItem1 = selected
                }
                .padding(.leading, 21)
                
                Spacer()
            }
            .frame(width: 315, height: 160, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.03), radius: 30, x: 0.0, y: 10.0)
            .padding(.top, 11)
            
            HStack {
                Text("Total")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
         
                Spacer()
                
                Text("23,000")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
            }
            .padding(EdgeInsets(top: 70, leading: 50, bottom: 0, trailing: 50))
            
            GenericButton(name: "Proceed to payment") {
                withAnimation {
                    self.shouldShowPayment.toggle()
                }
            }
            .padding(.top, 20)
            Spacer()
        }
        .background(Color("Grey"))
        .edgesIgnoringSafeArea(.all)
    }
    
    fileprivate func showAddress() -> some View {
        return VStack {
            HStack {
                Text("Address details")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .padding(.leading, 53)
                
                Spacer()
                
                Text("Change")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(Color("Red2"))
                    .padding(.trailing, 53)
            }
            .padding(.top, 45)
            
            VStack {
                Text("Marvis Kparobo")
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 25)
                    .padding(.leading, 30)
                
                Capsule()
                    .frame(width: 232, height: 0.5, alignment: .leading)
                    .foregroundColor(Color.black.opacity(0.3))
                    .padding(.trailing, 25)
                
                Text("Km 5 refinery road oppsite re\npublic road, effurun, delta state")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                
                Capsule()
                    .frame(width: 232, height: 0.5, alignment: .leading)
                    .foregroundColor(Color.black.opacity(0.3))
                    .padding(.trailing, 25)
                
                Text("+234 9011039271")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                
                Spacer()
                
            }
            .frame(width: 315, height: 160, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.03), radius: 30, x: 0.0, y: 10.0)
            .padding(.top, 11)
        }
    }
    
    fileprivate func showPayment() -> some View {
        return VStack(spacing: 15) {
            
            RadioButtonField(id: 1,
                             label: "Card",
                             isMarked: $selectedItem2.wrappedValue == 1 ? true : false,
                             showImage: true,
                             imageName: "card") { selected in
                self.selectedItem2 = selected
            }
            .padding(.leading, 21)
            .padding(.top, 20)
            
            
            Capsule()
                .frame(width: 220, height: 0.5, alignment: .center)
            
            
            RadioButtonField(id: 2,
                             label: "Bank account",
                             isMarked: $selectedItem2.wrappedValue == 2 ? true : false,
                             showImage: true,
                             imageName: "bank") { selected in
                self.selectedItem2 = selected
            }
            .padding(.leading, 21)
            
            Spacer()
        }
        .frame(width: 315, height: 205, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.03), radius: 30, x: 0.0, y: 10.0)
        .padding(.top, 11)
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
