//
//  Avatar.swift
//  IM
//
//  Created by admin on 2022/1/13.
//

import SwiftUI

struct Avatar: View {
    
    var avatar: String
    var width: CGFloat = 50
    var height: CGFloat = 50
    var isCircle: Bool = true
    
    var body: some View {
        Image(avatar)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .if(isCircle) { $0.clipShape(Circle()) } else: { $0.clipped() }
    }
    
}

extension View {
  @ViewBuilder
  func `if`<TrueContent: View, FalseContent: View>(
    _ condition: Bool,
    if ifTransform: (Self) -> TrueContent,
    else elseTransform: (Self) -> FalseContent
  ) -> some View {
    if condition {
      ifTransform(self)
    } else {
      elseTransform(self)
    }
  }
}

//private extension Avatar

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(avatar: "avatar1", width: 100, height: 100, isCircle: false)
    }
}
