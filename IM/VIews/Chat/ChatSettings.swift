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
            
            Color(hex: 0xF4F5F9).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 0){
                    NavigationLink(destination: ContactDetailView(), label: {
                        HStack(spacing: 12){
                            Image("avatar1").resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())
                            Text("杀生丸").foregroundColor(IMColor.textColor)
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
                                    .fill(IMColor.lightGray) //给圆形填充颜色
                                    .frame(width: 40, height: 40)
                                Image(systemName: "plus").foregroundColor(Color.gray).font(.system(size: 22))
                            }
                            Text("发起群聊").foregroundColor(IMColor.textColor)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.all, 10)
                        .background(Color.white)
                    })
                    .fullScreenCover(isPresented: $groupChatFromChat, content: {
                        GroupChat(groupFullPagePresented: $groupChatFromChat)
                            .ignoresSafeArea(.container, edges: .bottom)
                    })
                }
                
                VStack(spacing: 0){
                    GeneralRow(title: "聊天记录",width: screenWidth, trailing: Image(systemName: "chevron.right"))
                }
                
                VStack(spacing: 0){
                    
                    Toggle("置顶聊天", isOn: $setTop)
                        .padding(.horizontal, 12)
                        .frame(width: screenWidth, height: 46)
                        .background(Color.white)
                        .foregroundColor(IMColor.textColor)
//                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                        .toggleStyle(CustomToggleStyle())
                        
                    
                    Toggle("消息免打扰", isOn: $noDisturb)
                        .padding(.horizontal, 12)
                        .frame(width: screenWidth, height: 46)
                        .background(Color.white)
                        .foregroundColor(IMColor.textColor)
                        .toggleStyle(CustomToggleStyle())
                }
                
                Button(action: {}, label: {
                    Text("删除聊天记录")
                        .font(.system(size: 16))
                        .foregroundColor(IMColor.red)
                })
                    .frame(width: screenWidth, height: 40)
                    .background(Color.white)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ChatSettings_Previews: PreviewProvider {
    static var previews: some View {
        ChatSettings()
    }
}
