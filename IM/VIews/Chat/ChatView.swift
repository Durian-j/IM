//
//  ChatView.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct ChatView: View {
    
    var chat: Chat
    
    var body: some View {
        
        VStack(spacing: 7){
            
            HStack{
                
                ChatAvatar(avatarList: chat.avatarList, personNum: chat.avatarNum)
                
                VStack(alignment: .leading, spacing: 3){
                    Text(chat.name).font(.system(size: 17)).foregroundColor(Color(hex: 0x333333))
                    Text(chat.messageDes).foregroundColor(.gray).font(.system(size: 14))
                }
                .padding(.leading,5)
                Spacer()
                VStack(alignment: .trailing, spacing: 3){
                    Text(chat.time).font(.system(size: 13)).foregroundColor(.gray)
                    ZStack{
                          Circle()
                          .frame(width: 20, height: 20)
                          .foregroundColor(Color(hex: 0xFC4525))
                        Text(chat.messageCount)
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                      }
                }
            }
            .padding([.leading,.trailing], 10)
            
            Divider()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat(id: 1, name: "张三", avatarList: ["avatar1"], avatarNum: 1, messageDes: "回看射雕处，千里暮云平", time: "11:35", messageCount: "5"))
    }
}
