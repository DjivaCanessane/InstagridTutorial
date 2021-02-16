//
//  GridLayout.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct GridLayout: View {
    var defaultImage: some View {
        ZStack {
            Rectangle().fill(Color.white)
            Image("Plus")
        }
    }
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) { defaultImage }
                Button(action: {}) { defaultImage }
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            HStack {
                Button(action: {}) { defaultImage }
                Button(action: {}) { defaultImage }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(Color.blue)
        .aspectRatio(1, contentMode: .fit)
        .padding(8)
        
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout()
    }
}
