//
//  MeHome.swift
//  IM
//
//  Created by sfere on 2021/12/2.
//

import SwiftUI

struct MeHome: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        ZStack{
            
            Color(hex: 0xF4F5F9).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        HStack{
                            VStack(alignment: .leading){
                                Text("慕容垂")
                                    .font(.system(size: 24))
                                    .padding(.bottom, 2)
                                
                                Text("15365456465")
                                    .font(.system(size: 16))
                            }
                            Spacer()
                            Image("avatar1").resizable().scaledToFill().frame(width: 80, height: 80).clipShape(Circle())
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .padding(.top, safeAreaInsets?.top)
                        .foregroundColor(IMColor.textColor)
                        .frame(width: screenWidth, height: 170)
                        .background(Color.white)
                        
                    })
                
                VStack(spacing: 0){
                    GeneralRow(title: "账号与安全",width: screenWidth
                               ,leading: AnyView(Text(IconFont.accountSecurity.rawValue)
                                                    .foregroundColor(Color(hex: 0x46a6fa))
                                                    .font(.custom("iconfont", size: 18))),
                               trailing: Image(systemName: "chevron.right"))
                    GeneralRow(title: "消息通知",width: screenWidth
                               ,leading: AnyView(Text(IconFont.notification.rawValue)
                                                    .foregroundColor(Color(hex: 0x2bd9a4))
                                                    .font(.custom("iconfont", size: 18))),
                               trailing: Image(systemName: "chevron.right"))
                    GeneralRow(title: "隐私设置",width: screenWidth
                               ,leading: AnyView(Text(IconFont.privacy.rawValue)
                                                    .foregroundColor(Color(hex: 0xfdcb76))
                                                    .font(.custom("iconfont", size: 18))),
                               trailing: Image(systemName: "chevron.right"))
                    GeneralRow(title: "通用",width: screenWidth
                               ,leading: AnyView(Text(IconFont.general.rawValue)
                                                    .foregroundColor(Color(hex: 0x19cec9))
                                                    .font(.custom("iconfont", size: 18))),
                               trailing: Image(systemName: "chevron.right"))
                    GeneralRow(title: "关于",width: screenWidth
                               ,leading: AnyView(Text(IconFont.about.rawValue)
                                                    .foregroundColor(Color(hex: 0x98a9ff))
                                                    .font(.custom("iconfont", size: 18))),
                               trailing: Image(systemName: "chevron.right"))
                }
                
                Spacer()
            }
        }
    }
}

struct MeHome_Previews: PreviewProvider {
    static var previews: some View {
        MeHome().ignoresSafeArea()
    }
}
