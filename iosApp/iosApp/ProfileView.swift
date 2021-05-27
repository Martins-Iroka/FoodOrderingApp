//
//  ProfileView.swift
//  iosApp
//
//  Created by Martins on 5/27/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    fileprivate func itemView(_ name: String) -> some View {
        return HStack {
            Text(name)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.leading, 23)
            
            Spacer()
            
            Image("arrow_right")
                .padding(.trailing, 23)
        }
        .frame(width: 315, height: 60, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.03), radius: 30, x: 0.0, y: 10.0)
        .padding(.top, 27)
    }
    
    var body: some View {
        VStack {
            Text("My Profile")
                .font(.system(size: 34))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 60)
                .padding(.leading, 41)
            
            HStack {
                Text("Personal details")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
        
                Spacer()
                
                Text("Change")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(Color("Red2"))
            }
            .padding(EdgeInsets(top: 44, leading: 42, bottom: 0, trailing: 57))
     
            VStack {
                HStack {
                    VStack {
                        Image("profile")
                            .padding(.top, 18)
                        Spacer()
                    }
                    
                    VStack(alignment:.leading) {
                        Text("Marvis Ighedosa")
                            .font(.system(size: 18))
                        
                        Text("Dosamarvis@gmail.com")
                            .font(.system(size: 15))
                            .foregroundColor(Color.black.opacity(0.5))
                            .frame(height: 18, alignment: .center)
                        
                        Capsule()
                            .frame(width: 165, height: 0.5, alignment: .center)
                        
                        Text("+234 9011039271")
                            .font(.system(size: 15))
                            .foregroundColor(Color.black.opacity(0.5))
                            .frame(height: 18, alignment: .center)
                        
                        Capsule()
                            .frame(width: 165, height: 0.5, alignment: .center)
                        
                        Text("No 15 uti street off ovie\n palace road effurun delta\n state")
                            .font(.system(size: 15))
                            .foregroundColor(Color.black.opacity(0.5))
                            .frame(height: 54, alignment: .center)
                        
                    }
                    .padding(.leading, 16)
                    
                }
                Spacer()
            }
            .frame(width: 315, height: 197, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.03), radius: 30, x: 0.0, y: 10.0)
            .padding(.top, 11)
         
            itemView("Orders")
           
            itemView("Pending reviews")
            
            itemView("FAQ")
            
            itemView("Help")
            
            GenericButton(name: "Update") {
                
            }
            .padding(.top, 30)
            Spacer()
        }
        .background(Color("Grey"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
