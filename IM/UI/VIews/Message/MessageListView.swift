//
//  MessageListView.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct MessageListView: View {
    
    @State private var messages: [Message] = Message.all
    
    var body: some View {
        ScrollView{
            
            SearchBoxVIew()
            
            VStack{
                ForEach(messages) { message in
                    NavigationLink(
                        destination: ChatView(title: message.name, membersNumber: message.avatarList.count),
                        label: {
                            MessageView(message: message)
                        })
                }
            }
        }
        .background(Color.white)
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
