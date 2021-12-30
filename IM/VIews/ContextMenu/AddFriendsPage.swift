//
//  AddFriendsPage.swift
//  IM
//
//  Created by admin on 2021/12/30.
//

import SwiftUI

struct AddFriendsPage: View {
    
    @State var searchAccount: String = ""
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle().fill().frame(height: 30).foregroundColor(Color(hex: 0xF5F5F5)).cornerRadius(5).padding(12.5)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 16))
                        .padding(.leading, 5)
                    TextField("请输入账号进行搜索", text: $searchAccount)
                        .font(.system(size: 16))
                }
                .foregroundColor(Color.gray)
                .padding()
            }
            Spacer()
        }
        .navigationBarTitle("添加朋友", displayMode: .inline)
    }
}

struct AddFriendsPage_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendsPage()
    }
}
