//
//  MessageListView.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import SwiftUI

struct MessageList: View {
    var body: some View {
        ScrollView{
            
            ScrollViewReader{ proxy in
                MessageRow(message: Message(id: 1, name: "", avatar: "a1", text: "hello", type: .text), isMe: false)
                
                Text("2021-10-10 10:10")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 14, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                
                MessageRow(message: Message(id: 1, name: "", avatar: "a1", text: "是子级依赖父级的尺寸，还是父级依赖子级的尺寸", type: .text), isMe: true)
                MessageRow(message: Message(id: 1, name: "", avatar: "a1", text: "但你面对这种问题时，你可能需要退回去重新思考你的方案，创造力是脱离这种困境的关键", type: .text), isMe: true)
                
                MessageRow(message: Message(id: 1, name: "", avatar: "a1", text: "hello", type: .text), isMe: false)
                
                Text("2021-10-10 10:10")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 14, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                
                MessageRow(message: Message(id: 1, name: "", avatar: "a1", text: "是子级依赖父级的尺寸，还是父级依赖子级的尺寸", type: .text), isMe: true)
                MessageRow(message: Message(id: 1, name: "", avatar: "a1", text: "但你面对这种问题时，你可能需要退回去重新思考你的方案，创造力是脱离这种困境的关键但你面对这种问题时，你可能需要退回去重新思考你的方案，创造力是脱离这种困境的关键但你面对这种问题时，你可能需要退回去重新思考你的方案，创造力是脱离这种困境的关键但你面对这种问题时，你可能需要退回去重新思考你的方案，创造力是脱离这种困境的关键但你面对这种问题时，你可能需要退回去重新思考你的方案，创造力是脱离这种困境的关键但你面对这种问题时，你可能需要退回去重新思考你的方案，创造力是脱离这种困境的关键", type: .text), isMe: true)
                
            }
        }
        .background(Color(hex: 0xF4F5F9))
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
