//
//  ChatSettings.swift
//  IM
//
//  Created by admin on 2022/1/5.
//

import SwiftUI

struct ChatSettings: View {
    
    @State private var setTop = false
    @State private var noDisturb = false
    @State var groupChatFromChat: Bool = false
    
    var body: some View {
        ZStack{
            Color("light_gray").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10){
                VStack(alignment: .leading, spacing: 0){
                    NavigationLink(destination: ContactDetailView(), label: {
                        HStack(spacing: 12){
                            Avatar(avatar: "avatar1", width: 45, height: 45)
                            Text("杀生丸").foregroundColor(Color("text_color"))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all, 10)
                        .background(Color.white)
                    })
                    Divider()
                    Button(action: {
                        groupChatFromChat = true
                    }, label: {
                        HStack(spacing: 15){
                            ZStack{
                                Circle()
                                    .fill(Color("medium_gray"))
                                    .frame(width: 40, height: 40)
                                Image(systemName: "plus").foregroundColor(Color.gray).font(.system(size: 28))
                            }
                            Text("发起群聊").foregroundColor(Color("text_color"))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all, 10)
                        .background(Color.white)
                    })
                    .fullScreenCover(isPresented: $groupChatFromChat, content: {
                        GroupChatView(groupFullPagePresented: $groupChatFromChat)
                            .ignoresSafeArea(.container, edges: .bottom)
                    })
                }
                VStack(spacing: 0){
                    GeneralRow(title: "聊天记录",width: screenWidth, trailing: AnyView(Image(systemName: "chevron.right")))
                }
                VStack(spacing: 0){
                    CustomToggle(title: "置顶聊天", isOn: $setTop)
                    Divider()
                    CustomToggle(title: "消息免打扰", isOn: $noDisturb)
                }
                Button(action: {}, label: {
                    Text("删除聊天记录")
                        .font(.system(size: 16))
                        .foregroundColor(Color("red_color"))
                }).frame(width: screenWidth, height: 40).background(Color.white)
                Spacer()
            }
            .padding(.top, 10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("聊天设置", displayMode: .inline)
        .navigationBarItems(leading: NavigationBackButton().offset(x: -8))
    }
}

#if DEBUG
struct ChatSettings_Previews: PreviewProvider {
    static var previews: some View {
        ChatSettings()
    }
}
#endif
