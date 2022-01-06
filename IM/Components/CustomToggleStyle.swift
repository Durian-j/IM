//
//  CustomToggleStyle.swift
//  IM
//
//  Created by sfere on 2022/1/6.
//

import SwiftUI

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
