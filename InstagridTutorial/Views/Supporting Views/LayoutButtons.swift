//
//  LayoutButtons.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct LayoutButtons: View {
    // On récupère le LayoutViewModel donné au InstagridTutorialApp
    @EnvironmentObject var layoutViewModel: LayoutViewModel

    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    // Le property wrapper @State permet d'indiquer à cette vue de se mettre à jour,
    // lorsque la valeur de cette propriété change
    @State var selectedFirstLayout = true
    @State var selectedSecondLayout = false
    @State var selectedThirdLayout = false

    var body: some View {
        let layoutButtonOne = Button(action: {
            withAnimation {
                //Update GridView
                layoutViewModel.showTopLeftButton = false
                layoutViewModel.showBottomRightButton = true

                //Update layout button Images
                selectedFirstLayout = true
                selectedSecondLayout = false
                selectedThirdLayout = false
            }
        }) {
            ZStack {
                Image("Layout 1")
                    .resizable()
                    .frame(width: 85, height: 85, alignment: .center)
                if selectedFirstLayout {
                    Image("Selected")
                        .resizable()
                        .frame(width: 85, height: 85, alignment: .center)
                }
            }
        }

        let layoutButtonTwo = Button(action: {
            withAnimation {
                //Update GridView
                layoutViewModel.showTopLeftButton = true
                layoutViewModel.showBottomRightButton = false
                
                //Update layout button Images
                selectedFirstLayout = false
                selectedSecondLayout = true
                selectedThirdLayout = false
            }
        }) {
            ZStack {
                Image("Layout 2")
                    .resizable()
                    .frame(width: 85, height: 85, alignment: .center)
                if selectedSecondLayout {
                    Image("Selected")
                        .resizable()
                        .frame(width: 85, height: 85, alignment: .center)
                }
            }
        }

        let layoutButtonThree = Button(action: {
            withAnimation {
                //Update GridView
                layoutViewModel.showTopLeftButton = true
                layoutViewModel.showBottomRightButton = true
                
                //Update layout button Images
                selectedFirstLayout = false
                selectedSecondLayout = false
                selectedThirdLayout = true
            }
        }) {
            ZStack {
                Image("Layout 3")
                    .resizable()
                    .frame(width: 85, height: 85, alignment: .center)
                if selectedThirdLayout {
                    Image("Selected")
                        .resizable()
                        .frame(width: 85, height: 85, alignment: .center)
                }
            }
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
