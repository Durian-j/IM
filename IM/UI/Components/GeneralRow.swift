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
    var color: Color = Color("text_color")
    var width: CGFloat = screenWidth - 30
    var leading: AnyView = AnyView(EmptyView())
    var trailing: AnyView = AnyView(EmptyView())
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                leading
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(color)
                Spacer()
                trailing
            }
            .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 15))
            .frame(width: width, height: 46, alignment: .leading)
            
            if showDivider {
                Divider()
            }
        }
        .background(Color.white)
        .frame(width: width)
    }
}

#if DEBUG
struct GeneralRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("light_gray").edgesIgnoringSafeArea(.all)
            GeneralRow(title: "我的收藏", showDivider: true, leading: AnyView(Image(systemName: "person")), trailing: AnyView(Image(systemName: "chevron.right"))
            )
        }
    }
}
#endif
