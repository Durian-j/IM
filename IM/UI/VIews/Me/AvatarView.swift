//
//  AvatarView.swift
//  IM
//
//  Created by admin on 2022/1/24.
//

import SwiftUI
import PartialSheet
import UIKit
import AVFoundation

struct AvatarView: View {
    
    @State private var image: UIImage = UIImage()
    
    var body: some View {
        VStack{
            Spacer()
//            Avatar(avatar: "avatar1", width: 350, height: 350, isCircle: false)
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            ConfirmView()
        }
        .navigationBarTitle("头像", displayMode: .inline)
        .navigationBarItems(trailing:  MoreOperationView(image: $image))
    }
}


// MARK: - ConfirmView

private extension AvatarView{
    struct ConfirmView: View {
        var body: some View {
            HStack{
                Text("是否使用此图片做为头像")
                Spacer()
                Button(action: {}, label: {
                    Text("确定")
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                })
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 10, trailing: 20))
        }
    }
}

// MARK: - More Operation

private extension AvatarView{
    struct MoreOperationView: View {
        
        @EnvironmentObject var partialSheetManager: PartialSheetManager
        @State private var showingAlert = false
        @State private var showImagePicker = false
        @Binding var image: UIImage
        
        var body: some View {
            Text(IconFont.point.rawValue).foregroundColor(Color("text_color")).font(.custom("iconfont", size: 18))
                .onTapGesture {
                    self.partialSheetManager.showPartialSheet({
                        print("dismiss sheet for item")
                    }) {
                        VStack(spacing: 0){
                            AvatarSelectRow(title: "查看大图", height: 30, paddingBottom: 8, action: {
                                self.partialSheetManager.closePartialSheet()
                            })
                            AvatarSelectRow(title: "拍照上传", action: {
                                AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
                                    DispatchQueue.main.async {
                                        if(accessGranted == true){
                                            showImagePicker = true
                                        }else{
                                            showingAlert = true
                                        }
                                    }
                                })
                            })
                            AvatarSelectRow(title: "从相册选择",hasDivider: false, action: {})
                        }
                    }
                }
                .fullScreenCover(isPresented: $showImagePicker, content: {
                    ImagePicker(sourceType: .savedPhotosAlbum) { image in
                        self.image = image
                    }.ignoresSafeArea()
                })
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("请在Iphone的“设置->隐私->相机”选项中，允许IM访问您的相机"),
                        primaryButton: .default(
                            Text("取消")
                        ),
                        secondaryButton: .default(
                            Text("设置"),
                            action: {
                                guard let url = URL(string: UIApplication.openSettingsURLString) else {
                                    return
                                }

                                if #available(iOS 10.0, *) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                } else {
                                    UIApplication.shared.openURL(url)
                                }
                            }
                        )
                    )
                }
        }
    }
}

// MARK: - Avatar Select

private extension AvatarView {
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

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
