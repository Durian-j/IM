//
//  ChatSettings.swift
//  IM
//
//  Created by admin on 2022/1/5.
//

import SwiftUI

struct ChatSettings: View {
    
    @State private var showGreeting = true
    
    var body: some View {
        
        ZStack{
            
            Color(hex: 0xF4F5F9).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20){
                
                VStack(spacing: 0){
                    
                    NavigationLink(destination: ContactDetailView(), label: {
                        HStack(spacing: 12){
                            Image("avatar1").resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())
                            Text("杀生丸").foregroundColor(IMColor.textColor)
                            Spacer()
                        }
                        .padding(.all, 10)
                        .background(Color.white)
                    })
                    Divider()
                    HStack{
                        Image(systemName: "add").resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())
                        Text("发起群聊").foregroundColor(IMColor.textColor)
                        Spacer()
                    }
                    .padding(.all, 10)
                    .background(Color.white)
                    
                }
                
                VStack(spacing: 0){
                    GeneralRow(title: "聊天记录",width: screenWidth, trailing: Image(systemName: "chevron.right"))
                }
                
                VStack(spacing: 0){
                    
                    Toggle("置顶聊天", isOn: $showGreeting)
                        .padding(.horizontal, 12)
                        .frame(width: screenWidth, height: 46)
                        .background(Color.white)
                        .foregroundColor(IMColor.textColor)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                    Toggle("消息免打扰", isOn: $showGreeting)
                        .padding(.horizontal, 12)
                        .frame(width: screenWidth, height: 46)
                        .background(Color.white)
                        .foregroundColor(IMColor.textColor)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
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
