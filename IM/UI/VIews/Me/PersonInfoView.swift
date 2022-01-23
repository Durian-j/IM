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
    
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @State private var showingAlert = false
    @State private var showImagePicker = false
    @State private var image: UIImage = UIImage()
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                HStack{
                    Text("头像").font(.system(size: 16))
                    Spacer()
                    Avatar(avatar: "avatar1", width: 60, height: 60)
                }
                .background(Color.white)
                .foregroundColor(Color("text_color"))
                .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
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
                Divider()
                GeneralRow(title: "昵称", showDivider: true, width: screenWidth, trailing: AnyView(Image(systemName: "chevron.right")))
            }
        }
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
