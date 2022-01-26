//
//  MessageRow.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct MessageRow: View {
    
    var message: Message
    @State var offset: CGFloat = 0
    @State var isSwiped: Bool = false
    
    var body: some View {
        ZStack{
            Color(hex: 0xFC4525)
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.easeIn) {
                    }
                }) {
                    Image(systemName: "trash")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 50)
                }
            }
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
            .frame(height: 64)
            .padding([.leading,.trailing], 10)
            .background(Color.white)
            .offset(x: offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
        .frame(height: 64)
    }
}

// MARK: - onChange, onEnd

private extension MessageRow{
    func onChanged(value: DragGesture.Value){
        if (value.translation.width < 0) {
            if (isSwiped) {
                offset = value.translation.width - 60
            }else{
                offset = value.translation.width
            }
        }
    }
    
    func onEnd(value: DragGesture.Value){
        withAnimation(.easeOut){
            if (value.translation.width < 0) {
                if (-value.translation.width > UIScreen.main.bounds.width / 2){
                    offset = -60
                } else if (-offset > 50) {
                    isSwiped = true
                    offset = -60
                } else {
                    isSwiped = false
                    offset = 0
                }
            } else {
                isSwiped = false
                offset = 0
            }
        }
    }
}

#if DEBUG
struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: Message(name: "张三", avatarList: ["avatar1"], avatarNum: 1, messageDes: "回看射雕处，千里暮云平", time: "11:35", messageCount: "5", offset: 0, isSwiped: false))
    }
}
#endif
