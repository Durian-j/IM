//
//  ChatTextArea.swift
//  IM
//
//  Created by admin on 2022/2/7.
//

import SwiftUI

struct ChatTextArea: View {
    @Binding var height: CGFloat
    @Binding var text: String
    
    init(text: Binding<String>, height: Binding<CGFloat>) {
        self._text = text
        self._height = height
    }
    
    var body: some View {
        GeometryReader { geo in
            ChatTextView(text: $text, height: $height, width: geo.size.width)
        }
        .frame(height: height)
    }
}
