//
//  GroupChatSettings.swift
//  IM
//
//  Created by admin on 2022/1/6.
//

import SwiftUI

struct GroupChatSettings: View {
    
    @State private var setTop = false
    
    @State private var noDisturb = false
    
    @State var groupChatFromChat: Bool = false
    
    var body: some View {
        
        ZStack{
            
            Color("light_gray").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 0){
                    NavigationLink(destination: ContactDetailView(), label: {
                        HStack(spacing: 12){
                            Image("avatar1").resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())
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
                                    .fill(Color("light_gray"))
                                    .frame(width: 50, height: 50)
                                Image(systemName: "plus").foregroundColor(Color.gray).font(.system(size: 28))
                            }
                            Text("发起群聊").foregroundColor(Color("text_color"))
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
                        .foregroundColor(Color("text_color"))
                        .toggleStyle(CustomToggleStyle())
                        
                    
                    Toggle("消息免打扰", isOn: $noDisturb)
                        .padding(.horizontal, 12)
                        .frame(width: screenWidth, height: 46)
                        .background(Color.white)
                        .foregroundColor(Color("text_color"))
                        .toggleStyle(CustomToggleStyle())
                }
                
                Button(action: {}, label: {
                    Text("删除聊天记录")
                        .font(.system(size: 16))
                        .foregroundColor(Color("red_color"))
                })
                    .frame(width: screenWidth, height: 40)
                    .background(Color.white)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("聊天设置", displayMode: .inline)
    }
}

struct GroupChatSettings_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatSettings()
    }
}
