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
                                    Image(systemName: "minus.circle.fill")
                                    Text("删除").font(.system(size: 15))
                                }.foregroundColor(Color("red_color"))
                            }).padding(.leading, 25)
                        }.padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                        HStack(spacing: 35){
                            VStack(spacing: 5){
                                Avatar(avatar: "avatar1", width: 40, height: 40)
                                Text("Tom").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Avatar(avatar: "a1", width: 40, height: 40)
                                Text("Jerry").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Avatar(avatar: "a2", width: 40, height: 40)
                                Text("Jack").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Avatar(avatar: "a3", width: 40, height: 40)
                                Text("LiLei").font(.system(size: 14)).foregroundColor(Color("text_color"))
                            }
                            VStack(spacing: 5){
                                Avatar(avatar: "a4", width: 40, height: 40)
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
                    CustomToggle(title: "置顶聊天", isOn:  $setTop)
                    Divider()
                    CustomToggle(title: "消息免打扰", isOn:  $noDisturb)
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

#if DEBUG
struct GroupChatSettings_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatSettings()
    }
}
#endif
