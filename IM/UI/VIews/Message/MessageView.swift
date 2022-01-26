//
//  MessageView.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct MessageView: View {
    
    @State private var messages: [Message] = Message.all
    
    var body: some View {
        ScrollView{
            SearchBoxVIew()
            VStack(spacing: 0){
                ForEach(messages) { message in
                    VStack(spacing: 0){
                        NavigationLink(
                            destination: ChatView(title: message.name, membersNumber: message.avatarList.count),
                            label: {
                                MessageRow(message: message)
                            })
                            .buttonStyle(StaticButtonStyle())
                        Divider()
                    }
                }
            }
        }
        .background(Color.white)
    }
}

// 禁用 NavigationLink 和 Button 点击高亮效果
struct StaticButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

#if DEBUG
struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
#endif
