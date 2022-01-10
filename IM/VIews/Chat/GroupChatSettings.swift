//
//  GroupGroupChatSettings.swift
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
            
            VStack(spacing: 10){
                
                VStack(alignment: .leading, spacing: 0){
                    GeneralRow(title: "多人聊天名称",width: screenWidth, trailing: AnyView(HStack(spacing: 2){
                        Text("研发工作组")
                        Image(systemName: "chevron.right")
                    }.font(.system(size: 16)).foregroundColor(Color.gray)))
                    
                    GeneralRow(title: "创建人",width: screenWidth, trailing: AnyView(HStack(spacing: 2){
                        Text("Tom")
                        Image(systemName: "chevron.right")
                    }.font(.system(size: 16)).foregroundColor(Color.gray)))
                    
                    VStack{
                        HStack{
                            Text("组成员（5人）").font(.system(size: 16)).foregroundColor(Color("text_color"))
                            Spacer()
                            Button(action: {}, label: {
                                HStack(spacing: 2){
                                    Image(systemName: "plus.circle.fill")
                                    Text("邀请").font(.system(size: 15))
                                }
                            })
                            
                            Button(action: {}, label: {
                                HStack(spacing: 2){
                                    Image(systemName: "plus.circle.fill")
                                    Text("删除").font(.system(size: 15))
                                }.foregroundColor(Color("red_color"))
                            }).padding(.leading, 25)
                        }.padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                        
                        HStack(spacing: 35){
                            VStack(spacing: 5){
                                Image("avatar1").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(Circle())
                                Text("Tom").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Image("a1").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(Circle())
                                Text("Jerry").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Image("a2").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(Circle())
                                Text("Jack").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Image("a3").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(Circle())
                                Text("LiLei").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Image("a4").resizable().scaledToFill().frame(width: 40, height: 40).clipShape(Circle())
                                Text("HanMeiMei").font(.system(size: 14)).foregroundColor(Color("text_color")).lineLimit(1)
                            }
                        }.padding(EdgeInsets(top: 0, leading: 15, bottom: 12, trailing: 15))
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                }
                
                VStack(spacing: 0){
                    GeneralRow(title: "聊天记录",width: screenWidth, trailing: AnyView(Image(systemName: "chevron.right")))
                }
                
                VStack(spacing: 0){
                    
                    Toggle("置顶聊天", isOn: $setTop)
                        .padding(.horizontal, 12)
                        .frame(width: screenWidth, height: 46)
                        .background(Color.white)
                        .foregroundColor(Color("text_color"))
                        .toggleStyle(CustomToggleStyle())
                        
                    Divider()
                    
                    Toggle("消息免打扰", isOn: $noDisturb)
                        .padding(.horizontal, 12)
                        .frame(width: screenWidth, height: 46)
                        .background(Color.white)
                        .foregroundColor(Color("text_color"))
                        .toggleStyle(CustomToggleStyle())
                }
                
                Button(action: {}, label: {
                    Text("退出讨论组")
                        .font(.system(size: 16))
                        .foregroundColor(Color("red_color"))
                }).frame(width: screenWidth, height: 40).background(Color.white)
                
                Spacer()
            }
            .padding(.top, 10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("多人聊天设置", displayMode: .inline)
        .navigationBarItems(leading: NavigationBackButton().offset(x: -8))
    }
}

struct GroupChatSettings_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatSettings()
    }
}
