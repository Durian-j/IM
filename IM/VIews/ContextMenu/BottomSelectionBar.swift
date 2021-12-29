//
//  BottomSelectionBar.swift
//  IM
//
//  Created by sfere on 2021/12/29.
//

import SwiftUI

struct BottomSelectionBar: View {
    
    @EnvironmentObject var model: ContactModel
    
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(model.contactList){ contact in
                        if(contact.select == true){
                            Image(contact.avatar).resizable().scaledToFill().frame(width: 40, height: 40).clipShape(Circle())
                        }
                    }
                }
            }
            Spacer()
            Button(action: {
                print(model.contactList)
            }, label: {
                Text("确定").font(.system(size: 15))
            })
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Color.blue)
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color(hex: 0xF4F5F9))
    }
}

struct BottomSelectionBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomSelectionBar()
    }
}
