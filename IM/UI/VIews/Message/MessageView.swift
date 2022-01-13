//
//  MessageView.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
        
        VStack(spacing: 7){
            
            HStack{
                
                MessageAvatar(avatarList: message.avatarList, personNum: message.avatarNum)
                
                VStack(alignment: .leading, spacing: 3){
                    Text(message.name).font(.system(size: 17)).foregroundColor(Color("text_color"))
                    Text(message.messageDes).foregroundColor(.gray).font(.system(size: 14))
                }
                .padding(.leading,5)
                Spacer()
                VStack(alignment: .trailing, spacing: 3){
                    Text(message.time).font(.system(size: 13)).foregroundColor(.gray)
                    ZStack{
                          Circle()
                          .frame(width: 20, height: 20)
                          .foregroundColor(Color(hex: 0xFC4525))
                        Text(message.messageCount)
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

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(id: 1, name: "张三", avatarList: ["avatar1"], avatarNum: 1, messageDes: "回看射雕处，千里暮云平", time: "11:35", messageCount: "5"))
    }
}
