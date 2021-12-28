//
//  MeHome.swift
//  IM
//
//  Created by sfere on 2021/12/2.
//

import SwiftUI

struct MeHome: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        ZStack{
            
            Color(hex: 0xF4F5F9).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        HStack{
                            VStack(alignment: .leading){
                                Text("张三")
                                    .font(.system(size: 24))
                                    .padding(.bottom, 2)
                                
                                Text("15365456465")
                                    .font(.system(size: 16))
                            }
                            Spacer()
                            Image("a3").resizable().scaledToFill().frame(width: 80, height: 80).clipShape(Circle())
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .frame(width: screenWidth, height: 160)
                        .background(Color.white)
                        
                    })
                
                VStack(spacing: 0){
                    GeneralRow(title: "账号与安全",width: screenWidth, trailing: Image(systemName: "chevron.right"))
                    GeneralRow(title: "通知",width: screenWidth, trailing: Image(systemName: "chevron.right"))
                    GeneralRow(title: "设置",width: screenWidth,trailing: Image(systemName: "chevron.right"))
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
