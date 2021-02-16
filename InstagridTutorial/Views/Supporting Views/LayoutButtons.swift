//
//  LayoutButtons.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct LayoutButtons: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("Layout 1")
                    .resizable()
                    .frame(width: 85, height: 85, alignment: .center)
            }
            
            Button(action: {}) {
                Image("Layout 2")
                    .resizable()
                    .frame(width: 85, height: 85, alignment: .center)
            }
            
            Button(action: {}) {
                Image("Layout 3")
                    .resizable()
                    .frame(width: 85, height: 85, alignment: .center)
            }
        }
        .padding(.bottom)
        .padding(.horizontal)
        
    }
}

struct LayoutButtons_Previews: PreviewProvider {
    static var previews: some View {
        LayoutButtons()
    }
}
