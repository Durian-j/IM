//
//  ChatListView.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct ChatListView: View {
    
    @State private var chats: [Chat] = Chat.all
    
    var body: some View {
        ScrollView{
            
            SearchBoxVIew()
            
            VStack{
                ForEach(chats) { chat in
                    NavigationLink(
                        destination: MessageView(title: chat.name),
                        label: {
                            ChatView(chat: chat)
                        })
                }
            }
        }
        .background(Color.white)
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
