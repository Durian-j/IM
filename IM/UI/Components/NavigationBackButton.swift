//
//  NavigationBackButton.swift
//  IM
//
//  Created by sfere on 2022/1/7.
//

import SwiftUI

struct NavigationBackButton: View {
    
    var color: Color = Color.black
    var title: String = "返回"
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            HStack(spacing: 4){
                Image(systemName: "chevron.left").font(Font.system(size: 17))
                Text(title)
                Spacer()
            }.foregroundColor(color)
        })
    }
}

#if DEBUG
struct NavigationBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBackButton()
    }
}
#endif
