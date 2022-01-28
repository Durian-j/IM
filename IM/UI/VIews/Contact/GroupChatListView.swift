//
//  GroupChatListView.swift
//  IM
//
//  Created by sfere on 2022/1/10.
//

import SwiftUI

struct GroupChatListView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 0){
                ZStack{
                    Rectangle().fill().frame(height: 30).foregroundColor(Color("medium_gray")).cornerRadius(5).padding(12.5)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16))
                            .padding(.leading, 5)
                        TextField("搜索", text: $searchText)
                            .font(.system(size: 16))
                    }
                    .foregroundColor(Color.gray)
                    .padding()
                }
                Divider()
                MyGroupChatRow(title: "群聊1", avatarList:  ["a1","a2","a3","a4"])
                MyGroupChatRow(title: "群聊2", avatarList:  ["a1","a2","a3","a4"])
                MyGroupChatRow(title: "群聊4", avatarList:  ["a1","a2","a3","a4"])
                MyGroupChatRow(title: "群聊6", avatarList:  ["a1","a2","a3","a4"])
                MyGroupChatRow(title: "群聊7", avatarList:  ["a1","a2","a3","a4"])
            }
        }
        .navigationBarTitle("群聊", displayMode: .inline)
    }
}

// MARK: - FriendRequestRow

private extension GroupChatListView{
    struct MyGroupChatRow: View {
        let title: String
        let avatarList: Array<String>
        
        var body: some View {
            NavigationLink(destination: ChatView(title: title, membersNumber: avatarList.count), label: {
                VStack(spacing: 0){
                    HStack(spacing: 10){
                        MessageAvatar(avatarList: avatarList, personNum: avatarList.count)
                        Text(title).font(.system(size: 17)).foregroundColor(Color("text_color"))
                        Spacer()
                    }.padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    Divider()
                }
            })
            
        }
    }
}

struct GroupChatListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatListView()
    }
}
