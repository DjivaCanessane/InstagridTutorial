//
//  ContentView.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct MainView: View {
    // On instancie les 3 sous vues que nous avons créées
    let headerView = HeaderView()
    let gridLayout = GridLayout()
    let layoutButtons = LayoutButtons()

    var body: some View {
        // On crée une ZStack pour donner une couleur de fond et afficher les sous vues
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            // GeometryReader permet de récupérer les dimensions de l'appareil et permet donc de bien définir la taille de la vue
            GeometryReader { geometry in
                VStack {
                    headerView
                    gridLayout
                    layoutButtons
                }.frame(width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
