//
//  ChatView.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import SwiftUI

struct ChatView: View {
    
    var title: String
    var membersNumber: Int
    
    var body: some View {
        GeometryReader { proxy in
            VStack (spacing: 0) {
                ChatList()
                SendBox(proxy: proxy)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: destinationView(),
                    label: {
                        Text(IconFont.point.rawValue)
                            .foregroundColor(Color("text_color"))
                            .font(.custom("iconfont", size: 18))
                    })
            )
        }
    }
}

// MARK: - destinationView

private extension ChatView{
    func destinationView() -> some View {
        return Group {
            if membersNumber > 1 {
                GroupChatSettings()
            } else {
                ChatSettings()
            }
        }
    }
}

#if DEBUG
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(title: "tom", membersNumber: 1)
    }
}
#endif
