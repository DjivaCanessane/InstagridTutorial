//
//  ContentView.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct MainView: View {
    // Il n'est pas nécessaire de récupérer le LayoutViewModel dans cette vue, crée et donné au InstagridTutorialApp
    // pour que les sous vues puissent y accèder

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
