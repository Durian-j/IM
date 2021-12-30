//
//  GeneralRow.swift
//  IM
//
//  Created by sfere on 2021/12/23.
//

import SwiftUI

struct GeneralRow: View {
    
    var title: String
    var showDivider: Bool = true
    var color: Color = Color(hex: 0x333333)
    var width: CGFloat = screenWidth - 30
    var leading: AnyView = AnyView(EmptyView())
    var trailing: Image = Image("")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            HStack{
                leading.padding(.trailing, 5)
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(color)
                Spacer()
                trailing
                    .font(.system(size: 14))
            }
            .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            .frame(width: width, height: 40,alignment: .leading)
            
            if showDivider {
                Divider()
            }
        }
        .background(Color.white)
        .frame(width: width)
    }
}

struct GeneralRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color(hex: 0xF4F5F9).edgesIgnoringSafeArea(.all)
            GeneralRow(title: "我的收藏", showDivider: true, leading: AnyView(Image(systemName: "person")), trailing: Image(systemName: "chevron.right")
            )
        }
    }
}
