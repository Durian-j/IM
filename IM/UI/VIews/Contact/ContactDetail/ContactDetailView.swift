//
//  ContactDetailView.swift
//  IM
//
//  Created by sfere on 2021/12/22.
//

import SwiftUI

struct ContactDetailView: View {
    
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
                Rectangle().fill(Color("dark_gray"))
                
                HStack {
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack(spacing: 4){
                            Image(systemName: "chevron.left").font(Font.system(size: 22))
                            Text("通讯录")
                        }.foregroundColor(.white)
                        
                    }).padding()
                    
                    Spacer()
                }
                .offset(x: -8)
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
