//
//  BottomSelectionBar.swift
//  IM
//
//  Created by sfere on 2021/12/29.
//

import SwiftUI

struct BottomSelectionBar: View {
    
    let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
    
    @EnvironmentObject var model: ContactModel
    
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(model.selectedList){ selectedContact in
                        Image(selectedContact.avatar).resizable().scaledToFill().frame(width: 35, height: 35).clipShape(Circle())
                    }
                }
            }
            Spacer()
            Button(action: {
                print(model.selectedList)
            }, label: {
                Text("确定\(model.selectedList.count > 0 ? "·" + String(model.selectedList.count) : "" )").font(.system(size: 14))
            })
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Color.blue)
            .cornerRadius(5)
        }
        .padding(.horizontal)
        .frame(height: (safeAreaInsets?.bottom ?? 0) + 50)
        .background(Color(hex: 0xF4F5F9))
    }
}

struct BottomSelectionBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomSelectionBar()
    }
}
