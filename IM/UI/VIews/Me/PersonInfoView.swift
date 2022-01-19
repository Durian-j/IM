//
//  PersonInfoView.swift
//  IM
//
//  Created by sfere on 2021/12/20.
//

import SwiftUI

struct PersonInfoView: View {
    
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                HStack{
                    Text("头像").font(.system(size: 16))
                    Spacer()
                    Avatar(avatar: "avatar1", width: 60, height: 60)
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(Color("text_color"))
                .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
                .onTapGesture {
                    self.showingActionSheet = true
                }
                .actionSheet(isPresented: $showingActionSheet) {
                    ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                        .default(Text("Red")) { self.backgroundColor = .red },
                        .default(Text("Green")) { self.backgroundColor = .green },
                        .default(Text("Blue")) { self.backgroundColor = .blue },
                        .cancel()
                    ])
                }
                .modifier(ActionSheetCustom())
                Divider()
                GeneralRow(title: "昵称", showDivider: true, width: screenWidth, trailing: AnyView(Image(systemName: "chevron.right")))
            }
        }
    }
}

struct PersonInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonInfoView()
    }
}
