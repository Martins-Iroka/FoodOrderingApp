//
//  CartView.swift
//  iosApp
//
//  Created by TellerOne on 5/28/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct CartView: View {
    @State var i = ""
    
    @State var foods = Food.foodList
    var body: some View {
        VStack {
            HStack {
                Image("arrow_left")
                    .offset(x: 41.0, y: 0.0)
                
                Spacer()
                
                Text("Cart")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.top, 60)
            
            if !foods.isEmpty {
                HStack {
                    Image("swipe_gesture")
                    
                    Text("swipe on an item to delete \(i)")
                        .font(.system(size: 10))
                        .fontWeight(.regular)
                }
                .padding(.top, 57)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(foods) { food in
                            FoodItemView2(food: foods[getIndex(food: food)], foods: $foods)
                        }
                    }
                    .padding(EdgeInsets(top: 50, leading: 50, bottom: 0, trailing: 40))
                }
                Spacer()
            } else {
                showEmptyView()
            }
        }
        .background(Color("Grey"))
        .edgesIgnoringSafeArea(.all)
    }
    
    func getIndex(food: Food) -> Int {
        return foods.firstIndex { (f) -> Bool in
            return food.id == f.id
        } ?? 0
    }
    
    func showEmptyView() -> some View {
        return VStack {
            Spacer()
            Image("cart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 113, height: 107)
                
            
            Text("Cart is empty")
                .font(.system(size: 28, weight: .semibold))
                .padding(.top, 10)
            Spacer()
            Spacer()
            
            GenericButton(name: "Start order") {
                print("order")
            }
            .padding(.bottom, 41)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
//        FoodItemView2(food: Food.foodList.first!)
        CartView()
    }
}


struct FoodItemView2: View {
    let food: Food
    let size: CGFloat = 100
    
    @State var x: CGFloat = 0.0
    @State var isSwipe: Bool = false
    @Binding var foods: [Food]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("Grey")]), startPoint: .leading, endPoint: .trailing)
            
            HStack {
                Spacer()
                
                Image("circle_heart")
                    .padding(.trailing, 10)
                
                Button(action: {
                    withAnimation(.easeIn) {
                        deleteFood()
                    }
                }, label: {
                    Image("circle_delete")
                })
            }
            
            HStack {
                Image(food.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .padding(.top, 16)
                    
                
                VStack {
                    Text(food.foodName)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Text(food.price)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("Red2"))
                        .padding(.top, 1)
                }
                Spacer()
            }
            .background(Color.white)
            .cornerRadius(20)
            .offset(x: x)
            .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnd(value:)))
        }
    }
    
    func onChange(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if isSwipe {
                x = value.translation.width - 120
            } else {
                x = value.translation.width
            }
        }
    }
    
    
    func onEnd(value: DragGesture.Value) {
        
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    x = -1000
                    deleteFood()
                }
                else if x < 120 {
                    isSwipe = true
                    x = -120
                }
                else {
                    isSwipe = false
                    x = 0.0
                }
            } else {
                isSwipe = false
                x = 0.0
            }
        }
    }
    
    func deleteFood() {
        foods.removeAll { (f) -> Bool in
            food.id == f.id
        }
    }
}
