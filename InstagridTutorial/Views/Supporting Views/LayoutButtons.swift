//
//  LayoutButtons.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct LayoutButtons: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        let layoutButtonOne = Button(action: {}) {
            Image("Layout 1")
                .resizable()
                .frame(width: 85, height: 85, alignment: .center)
        }

        let layoutButtonTwo = Button(action: {}) {
            Image("Layout 2")
                .resizable()
                .frame(width: 85, height: 85, alignment: .center)
        }

        let layoutButtonThree = Button(action: {}) {
            Image("Layout 3")
                .resizable()
                .frame(width: 85, height: 85, alignment: .center)
        }
        // Portrait mode
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            HStack {
                layoutButtonOne
                layoutButtonTwo
                layoutButtonThree
            }
            .padding(.bottom)
            .padding(.horizontal)
        // Landscape mode
        } else {
            VStack {
                layoutButtonOne
                layoutButtonTwo
                layoutButtonThree
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
        
        
    }
}

struct LayoutButtons_Previews: PreviewProvider {
    static var previews: some View {
        LayoutButtons()
    }
}
