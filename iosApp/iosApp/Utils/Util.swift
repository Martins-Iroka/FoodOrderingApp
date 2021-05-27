//
//  Util.swift
//  iosApp
//
//  Created by TellerOne on 5/25/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var cornerRadius: Int
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        return Path(path.cgPath)
    }
    
}

struct Tabs<Label: View>: View {
    @Binding var tabs: [String] // The tab titles
    @Binding var selection: Int // Currently selected tab
    let underlineColor: Color // Color of the underline of the selected tab
    let space: CGFloat
    let w: CGFloat
    // Tab label rendering closure - provides the current title and if it's the currently selected tab
    let label: (String, Bool) -> Label
    
    var body: some View {
        // Pack the tabs horizontally and allow them to be scrolled
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: space) {
                ForEach(tabs, id: \.self) {
                    self.tab(title: $0, width: w)
                }
            } 
        }
    }
    
    private func tab(title: String, width: CGFloat) -> some View {
        let index = self.tabs.firstIndex(of: title)!
        let isSelected = index == selection
        return Button(action: {
            // Allows for animated transitions of the underline,
            // as well as other views on the same screen
            withAnimation {
                self.selection = index
            }
        }) {
            VStack {
                label(title, isSelected)
                    .foregroundColor(isSelected ? Color("Red2") : Color("Grey4"))
                
                Capsule()
                    .foregroundColor(isSelected ? underlineColor : .clear)
                    .frame(width: width, height: 3, alignment: .center)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}
