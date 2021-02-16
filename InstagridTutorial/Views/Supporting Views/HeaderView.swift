//
//  HeaderView.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Instagrid")
                .font(Font.custom("ThirstySoftRegular", size: 30))
                .padding(32)
            Image("Arrow Up")
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 15, height: 15, alignment: .center)
            Text("Swipe up to share")
                .font(Font.custom("Delm-Medium", size: 20))
                .padding()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
