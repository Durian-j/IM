//
//  WordNavigation.swift
//  IM
//
//  Created by sfere on 2021/12/24.
//

import SwiftUI

struct WordNavigation: View {
    
    var words: [String] = [
        "A","B","C","D","E","F","G"
    ]
    
    @Binding var wordNavigationtappedIndex: Int
    
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing: 5){
                ForEach(0..<words.count,id: \.self){index in
                    Text(words[index])
                        .font(.system(size: 14))
                        .onTapGesture {
                            wordNavigationtappedIndex = index
                        }
                }
            }.padding()
        }
    }
}

struct WordNavigation_Previews: PreviewProvider {
    static var previews: some View {
        WordNavigation(wordNavigationtappedIndex: .constant(1))
    }
}
