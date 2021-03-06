//
//  RegisterForm.swift
//  IM
//
//  Created by sfere on 2021/11/24.
//

import SwiftUI

struct RegisterForm: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    @State private var userName = ""
    @State private var password = ""
    @State private var vertifyCode: String = ""
    
    
    var body: some View {
        VStack(spacing: 10){
            
            VStack{
                TextField("账号/手机号/邮箱", text: $userName)
                    .font(.system(size: 15))
                
                Divider()
            }
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 10)
            
            VStack{
                SecureField("密码", text: $password)
                    .font(.system(size: 15))
                
                Divider()
            }
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 10)
            
            VStack{
                HStack{
                    TextField("请输入验证码", text: $password)
                        .font(.system(size: 15))
                    
                    CountDownButton(vertifyCode: $vertifyCode)
                }
                Divider()
            }
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 15)
            
            Button(action: {
                print(123)
            }) {
                Text("登录")
            }
            .foregroundColor(.white)
            .frame(width: 260, height: 42, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(RoundedCorners(color: Color(hex: 0x2E59E6), tl: 20, tr: 0, bl: 0, br: 20))
            
                
            Divider().padding(.top, 20)
            
            Color.white.edgesIgnoringSafeArea(.all)
            
        }
        .padding()
        .padding(.top,20)
        .cornerRadius(20)
        .background(RoundedCorners(color: .white, tl: 20, tr: 0, bl: 0, br: 0))
        .offset(x: 0, y: 260)
        .frame(width: screenWidth - 80, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct RegisterForm_Previews: PreviewProvider {
    static var previews: some View {
        RegisterForm()
    }
}
