//
//  MessageRow.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import SwiftUI

struct MessageRow: View {
    
    let message: Message
    let isMe: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if isMe { Spacer() } else { Avatar(icon: message.avatar) }
            
            if message.type == .text { TextMessage(isMe: isMe, text: message.text ) }
            
            if isMe { Avatar(icon: message.avatar) } else { Spacer() }
        }
        .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
    }
    
    struct Avatar: View {
        let icon: String
        
        var body: some View {
            Image(icon)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(25)
        }
    }
    
    struct TextMessage: View {
        let isMe: Bool
        let text: String
        
        var body: some View {
            HStack(alignment: .top, spacing: 0) {
                if !isMe { Arrow(isMe: isMe) }
                
                Text(text)
                    .font(.system(size: 16))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(background)
                    .foregroundColor(isMe ? Color.white : Color.black)
                
                if isMe { Arrow(isMe: isMe) }
            }
        }
        
        private var background: some View {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(isMe ? Color(hex: 0x165AF7) : Color.white)
        }
    }
    
    struct Arrow: View {
        let isMe: Bool
        
        var body: some View {
            Path { path in
                path.move(to: .init(x: isMe ? 0 : 6, y: 14))
                path.addLine(to: .init(x: isMe ? 0 : 6, y: 26))
                path.addLine(to: .init(x: isMe ? 6 : 0, y: 20))
                path.addLine(to: .init(x: isMe ? 0 : 6, y: 14))
            }
            .fill(isMe ? Color(hex: 0x165AF7) : Color.white)
            .frame(width: 6, height: 30)
        }
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: Message(id: 1, name: "nm", avatar: "a1", text: "??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????", type: Message.MessageType.text), isMe: true)
            .previewLayout(.sizeThatFits)
    }
}
