//
//  ContactDetailView.swift
//  IM
//
//  Created by sfere on 2021/12/22.
//

import SwiftUI

struct ContactDetailView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ContactDetailBody()
            }
            .overlayPreferenceValue(NavigationKey.self) { value in
                VStack {
                    Navigation()
                        .frame(height: proxy.safeAreaInsets.top + 44)
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
    }
    
    struct Navigation: View {
        
        var body: some View {
            
            ZStack(alignment: .bottom) {
                Rectangle().fill(IMColor.darkGray)
                
                HStack {
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack(spacing: 0){
                            Image(systemName: "chevron.left").foregroundColor(.white).font(.system(size: 20))
                            Text("通讯录").foregroundColor(.white)
                        }
                        
                    }).padding()
                    
                    Spacer()
                }
                .frame(height: 44)
                
            }
            .frame(maxWidth: .infinity)
        }
        
        @Environment(\.presentationMode) var presentationMode
    }
    
    struct NavigationKey: PreferenceKey {
        typealias Value = [Anchor<CGPoint>]
        
        static var defaultValue: Value = []
        
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value.append(contentsOf: nextValue())
        }
    }
}

struct MomentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView()
    }
}
