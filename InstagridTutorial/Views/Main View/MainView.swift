//
//  ContentView.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct MainView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    let headerView = HeaderView()
    let gridLayout = GridLayout()
    let layoutButtons = LayoutButtons()

    var body: some View {

        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            // Portrait mode
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                GeometryReader { geometry in
                    VStack {
                        headerView
                        gridLayout
                        layoutButtons
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            // Landscape mode
            } else {
                GeometryReader { geometry in
                    HStack {
                        headerView
                        VStack {
                            Text("Instagrid")
                                .font(Font.custom("ThirstySoftRegular", size: 30))
                                .padding(.top, 8)
                            gridLayout
                        }
                        layoutButtons
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
