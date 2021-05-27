//
//  HomeView.swift
//  iosApp
//
//  Created by Martins on 5/25/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var searchWord = ""
    @State var selectionTab = 0
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                HStack {
                    Image("ham")
                        .padding(.leading, 55)
                    Spacer()
                    Image("shopping-cart")
                        .padding(.trailing, 41)
                }
                .padding(.top, 74)
                
                Text("Delicious food for you")
                    .font(.custom("SFPro_Heavy", size: 34))
                    .frame(width: 185)
                    .padding(.leading, 50)
                    .padding(.top, 43)
                
                HStack(spacing: 16) {
                    Image("search")
                        .padding(.leading, 35)
                    
                    TextField(
                        "Search",
                        text: $searchWord)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .font(.custom("ProText_Semibold", size: 17))
                        .foregroundColor(Color.black)
                }
                .frame(width: 314, height: 60, alignment: .center)
                .background(Color("Grey3"))
                .cornerRadius(30)
                .padding(.leading, 50)
                .padding(.top, 28)
                
                Tabs(tabs: .constant(["Foods", "Drinks", "Snacks", "Sauce"]),
                     selection: $selectionTab,
                     underlineColor: Color("Red2"), space: 41, w: 60) { title, isSelected  in
                    Text(title)
                        .font(.custom("SFProText", size: 17))
                }
                .padding(.leading, 70)
                .padding(.top, 46)

                HStack {
                    Spacer()
                    Text("See more")
                        .font(.system(size: 15))
                        .foregroundColor(Color("Red2"))
                        .padding(.top, 58)
                        .padding(.trailing, 41)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 34) {
                        ForEach(Food.foodList) { food in
                            NavigationLink(destination: FoodDetailView()) {
                                FoodItemView(food: food)
                            }
                            
                        }
                    }
                    .padding(EdgeInsets(top: 50, leading: 50, bottom: 0, trailing: 40))
                }
                Spacer()
            }
            .background(Color("Grey"))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct FoodItemView: View {
    
    let food: Food
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    Spacer()
                    Text(food.foodName)
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(alignment: .center)
                    
                    Text(food.price)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Red2"))
                        .padding(.top, 15)
                }
                .offset(x: 0.0, y: -60)
            }
            .frame(width: 220, height: 270)
            .background(
                Color.white
            )
            .cornerRadius(30)
            .shadow(color: Color("LightBlack"), radius: 30, x: 0.0, y: 30)
            
            Image(food.image)
                .frame(width: 168, height: 168, alignment: .center)
                .offset(x: 0.0, y: -80)
        }
    }
}

struct Food : Identifiable {
    let id = UUID().uuidString
    let image: String
    let foodName: String
    let price: String
    
    static let foodList = [
        Food(image: "foodie", foodName: "Veggie tomato mix", price: "N1,900"),
        Food(image: "food2", foodName: "Egg and cucmber", price: "N1,900"),
        Food(image: "food3", foodName: "Fried chicken meal", price: "N1,900"),
        Food(image: "food4", foodName: "Moi-moi and ekpa.", price: "N1,900")
    ]
}
