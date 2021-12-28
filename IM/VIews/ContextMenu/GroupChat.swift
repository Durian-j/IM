//
//  GroupChat.swift
//  IM
//
//  Created by sfere on 2021/12/24.
//

import SwiftUI

import SwiftUI

struct GroupChat: View {
    
    @State var searchText: String = ""
    
    @Binding var groupFullPagePresented: Bool
    
    @Binding var showContextMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    groupFullPagePresented = false
                    showContextMenu = false
                }, label: {
                    Text("取消")
                        .font(.system(size: 16))
                        .frame(width: 60)
                })
                Spacer()
                Text("选择联系人")
                Spacer()
                Text("")
                    .frame(width: 60)
            }
            
            ZStack{
                Rectangle().fill().frame(height: 30).foregroundColor(Color(hex: 0xF5F5F5)).cornerRadius(5).padding(12.5)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 16))
                        .padding(.leading, 5)
                    TextField("搜索", text: $searchText)
                        .font(.system(size: 16))
                }.padding()
            }
            
            ContactList(isAddressBook: false)
        }
    }
}

struct GroupChat_Previews: PreviewProvider {
    static var previews: some View {
        GroupChat(groupFullPagePresented: .constant(false), showContextMenu: .constant(false))
    }
}
