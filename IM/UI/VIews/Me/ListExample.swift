//
//  AnimationContentExample.swift
//  PartialSheetExample
//
//  Created by Eliott Robson on 21/09/2020.
//  Copyright © 2020 Swift. All rights reserved.
//

import SwiftUI
import PartialSheet

struct ListExample: View {
    @State private var showImagePicker = false
        //这里的image用于放置等会获取的照片
        @State private var image: UIImage = UIImage()
        var body: some View {
            List{
                Button(action: {
                    showImagePicker = true
                }, label: {
                    Text("Select Image")
                })
                
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .sheet(isPresented: $showImagePicker,
                   content: {
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.image = image
                }
            })
        }
}

