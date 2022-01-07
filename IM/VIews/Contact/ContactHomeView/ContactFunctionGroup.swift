//
//  ContactFunctionGroup.swift
//  IM
//
//  Created by sfere on 2021/11/30.
//

import SwiftUI

struct ContactFunctionGroup: View {
    var body: some View {
        HStack(spacing: 40){
            VStack(spacing: 6){
                Button(action: {
                }, label: {
                    ZStack {
                        Circle().fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0x46A6FA), Color(hex: 0x98A9FF)]),startPoint: .leading,endPoint: .trailing))
                        Image(systemName: "person.fill")
                            .font(.system(size: 25))
                            .foregroundColor(Color.white)
                    }.frame(width: 45, height: 45)
                })
                Text("新的朋友")
                    .font(.system(size: 14))
                    .foregroundColor(Color("text_color"))
            }
            
            VStack(spacing: 6){
                Button(action: {
                }, label: {
                    ZStack {
                        Circle().fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0x2BD9A4), Color(hex: 0x19CEC9)]),startPoint: .leading,endPoint: .trailing))
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                    }.frame(width: 45, height: 45)
                })
                Text("群聊")
                    .font(.system(size: 14))
                    .foregroundColor(Color("text_color"))
            }
            
            Spacer()
        }
        .padding(.leading, 15)
    }
}

struct ContactFunctionGroup_Previews: PreviewProvider {
    static var previews: some View {
        ContactFunctionGroup()
    }
}
