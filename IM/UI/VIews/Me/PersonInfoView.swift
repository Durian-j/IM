//
//  PersonInfoView.swift
//  IM
//
//  Created by sfere on 2021/12/20.
//

import SwiftUI
import PartialSheet
import UIKit
import AVFoundation

struct PersonInfoView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                NavigationLink(destination: SwipeCellDemoView(), label: {
                    HStack{
                        Text("头像").font(.system(size: 16))
                        Spacer()
                        Avatar(avatar: "avatar1", width: 60, height: 60)
                    }
                    .background(Color.white)
                    .foregroundColor(Color("text_color"))
                    .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
                })
                Divider()
                GeneralRow(title: "昵称", showDivider: true, width: screenWidth, trailing: AnyView(Image(systemName: "chevron.right")))
            }
        }.navigationBarTitle("个人信息", displayMode: .inline)
    }
}

// MARK: - Avatar Select

private extension PersonInfoView {
    struct AvatarSelectRow: View {
        let title: String
        var height: CGFloat = 50
        var paddingBottom: CGFloat = 0
        var hasDivider: Bool = true
        let action: () -> Void
        
        var body: some View {
            VStack(spacing: 0){
                Button(action: action, label: {
                    HStack{
                        Text(title)
                    }
                    .frame(maxWidth: .infinity, minHeight: height)
                    .font(.system(size: 16))
                    .foregroundColor(Color("text_color"))
                })
                    .padding(.bottom, paddingBottom)
                if(hasDivider){
                    Divider()
                }
            }
        }
    }
}

struct PersonInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonInfoView()
    }
}
