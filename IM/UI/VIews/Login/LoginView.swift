//
//  LoginView.swift
//  IM
//
//  Created by sfere on 2021/11/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showLogin: Bool = true
    @Binding var isAuth: Bool
    
    var body: some View {
        VStack{
            ZStack{
                Image("logo-ionitron")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .offset(x: screenWidth / 2 - 50, y: -50 )
                
                HStack{
                    Button(action: {
                        showLogin = true
                    }) {
                        Text("登录")
                            .foregroundColor(.white)
                            .font(showLogin ? .title: .body)
                    }
                    Rectangle()
                        .fill(Color("primary_blue"))
                        .frame(width: 30, height: 20)
                    Button(action: {
                        showLogin = false
                    }) {
                        Text("注册")
                            .font(showLogin ? .body: .title)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 50)
                
                if(showLogin){
                    LoginForm(isAuth: $isAuth)
                }else{
                    RegisterForm()
                }
            }
            .frame(width: screenWidth, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.top,safeAreaInsets?.top ?? 0 + 8.0)
            .background(Color("primary_blue"))
            
            Spacer()
        }
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isAuth: .constant(false)).ignoresSafeArea()
    }
}
#endif
