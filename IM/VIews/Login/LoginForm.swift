//
//  LoginForm.swift
//  IM
//
//  Created by sfere on 2021/11/24.
//

import SwiftUI

struct LoginForm: View {
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    @State private var userName = ""
    @State private var password = ""
    @State private var showPwd: Bool = false
    @State private var vertifyCode: String = ""
    
    @State private var showVertifyCode: Bool = false
    @Binding var isAuth: Bool
    
    var body: some View {
        VStack(spacing: 10){
            
            TextField("账号/手机号/邮箱", text: $userName)
                .font(.system(size: 15))
            
            Divider()
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 10)
            
            VStack{
                if(!showVertifyCode) {
                    HStack{
                        if(showPwd){
                            TextField("密码", text: $password)
                                .font(.system(size: 15))
                        }else{
                            SecureField("密码", text: $password)
                                .font(.system(size: 15))
                        }
                        Button(action: {
                            showPwd.toggle()
                        }){
                            Image(systemName: showPwd ? "eye": "eye.slash")
                                .foregroundColor(IMColor.themeColor)
                        }
                    }
                }else{
                    HStack{
                        TextField("请输入验证码", text: $password)
                            .font(.system(size: 15))
                        CountDownButton(vertifyCode: $vertifyCode)
                    }
                }
                Spacer()
                Divider()
            }.frame(height: 26)
            
            if(!showVertifyCode){
                HStack{
                    Button(action: {
                        print(123)
                    }) {
                        Text("忘记密码")
                            .foregroundColor(Color(hex: 0xF7BE4D))
                            .font(.system(size: 15))
                    }
                    Spacer()
                }
                .padding(.top, 10)
            }
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 15)
            
            Button(action: {
                print("账号是：\(userName)，密码是：\(password)，验证码是：\(vertifyCode)")
                isAuth = true
            }) {
                Text("登录")
            }
            .foregroundColor(.white)
            .frame(width: 260, height: 42, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(RoundedCorners(color: IMColor.themeColor, tl: 20, tr: 0, bl: 0, br: 20))
            
            Button(action: {
                showVertifyCode.toggle()
            }) {
                Text(showVertifyCode ? "密码登录": "验证码登录")
                    .font(.system(size: 15))
                    .foregroundColor(IMColor.themeColor)
            }
            .padding(.top, 10)
                
            Divider().padding(.top, 10)
            
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

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(isAuth: .constant(false))
    }
}
