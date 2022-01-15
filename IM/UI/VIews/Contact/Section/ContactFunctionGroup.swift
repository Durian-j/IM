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
                NavigationLink(destination: NewFriendsView(), label: {
                    ContactFunctionButton(from: Color(hex: 0x46A6FA), end: Color(hex: 0x98A9FF), icon: "person.fill", size: 25)
                })
                Text("新的朋友")
                    .font(.system(size: 14))
                    .foregroundColor(Color("text_color"))
            }
            VStack(spacing: 6){
                Button(action: {
                }, label: {
                    ContactFunctionButton(from: Color(hex: 0x2BD9A4), end: Color(hex: 0x19CEC9), icon: "bubble.left.and.bubble.right.fill", size: 20)
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

// MARK: - Button Style

private extension ContactFunctionGroup{
    struct ContactFunctionButton: View {
        let from: Color
        let end: Color
        let icon: String
        let size: CGFloat
        var body: some View {
            ZStack {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [from, end]),startPoint: .leading,endPoint: .trailing))
                Image(systemName: icon)
                    .font(.system(size: size))
                    .foregroundColor(Color.white)
            }.frame(width: 45, height: 45)
        }
    }
}

#if DEBUG
struct ContactFunctionGroup_Previews: PreviewProvider {
    static var previews: some View {
        ContactFunctionGroup()
    }
}
#endif
