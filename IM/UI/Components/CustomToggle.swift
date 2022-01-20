//
//  CustomToggle.swift
//  IM
//
//  Created by admin on 2022/1/13.
//
//  自定义switch按钮组件
//

import SwiftUI

// MARK: - Toggle View

struct CustomToggle: View {
    
    var title: String = ""
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(title, isOn: $isOn)
            .padding(.horizontal, 12)
            .frame(width: screenWidth, height: 46)
            .background(Color.white)
            .foregroundColor(Color("text_color"))
            .toggleStyle(CustomToggleStyle())
    }
}

// MARK: - Toggle Style

struct CustomToggleStyle: ToggleStyle {
    
    let width: CGFloat = 50

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: width / 2)
                    .frame(width: width, height: width / 2.0)
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                RoundedRectangle(cornerRadius: width / 2)
                    .frame(width: (width / 2) - 4, height: (width / 2) - 6)
                    .padding(4)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                }
            }
        }
    }
}

#if DEBUG
struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle(title: "置顶", isOn: .constant(true))
    }
}
#endif
