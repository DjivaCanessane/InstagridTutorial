//
//  GridLayout.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct GridLayout: View {
    @EnvironmentObject var layoutViewModel: LayoutViewModel
    @EnvironmentObject var imagePickerViewModel: ImagePickerViewModel
    
    // On se lie a la variable activeSheet de MainView grâce au property wrapper @Binding
    // Changer sa valeur ici entraînera une mise à jour du MainView
    @Binding var activeSheet: ActiveSheet?

    var defaultImage: some View {
        ZStack {
            Rectangle().fill(Color.white)
            Image("Plus")
        }
    }

    var body: some View {
        VStack {
            HStack {
                // Le gridLayout se mettra à jour automatiqument lorsque la valeur de showTopLeftButton
                if layoutViewModel.showTopLeftButton {
                    Button(action: {
                        // Permet d'affecter l'image choisi à sa case correspondante
                        imagePickerViewModel.sender = .topLeft
                        // Signal au MainView d'afficher le ImagePickerView par le biais d'un sheet
                        activeSheet = .pickImage
                    }) { imageView(for: imagePickerViewModel.selectedImageTopLeft) }
                }
                Button(action: {
                    // Permet d'affecter l'image choisi à sa case correspondante
                    imagePickerViewModel.sender = .topRight
                    // Signal au MainView d'afficher le ImagePickerView par le biais d'un sheet
                    activeSheet = .pickImage
                }) { imageView(for: imagePickerViewModel.selectedImageTopRight) }
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            HStack {
                Button(action: {
                    // Permet d'affecter l'image choisi à sa case correspondante
                    imagePickerViewModel.sender = .bottomLeft
                    // Signal au MainView d'afficher le ImagePickerView par le biais d'un sheet
                    activeSheet = .pickImage
                }) { imageView(for: imagePickerViewModel.selectedImageBottomLeft) }
                // Le gridLayout se mettra à jour automatiqument lorsque la valeur de showBottomRightButton
                if layoutViewModel.showBottomRightButton {
                    Button(action: {
                        // Permet d'affecter l'image choisi à sa case correspondante
                        imagePickerViewModel.sender = .bottomRight
                        // Signal au MainView d'afficher le ImagePickerView par le biais d'un sheet
                        activeSheet = .pickImage
                    }) { imageView(for: imagePickerViewModel.selectedImageBottomRight) }
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(Color.blue)
        .aspectRatio(1, contentMode: .fit)
        .padding(8)
        
    }
    
    // Le property wrapper @ViewBuilder d'appeller la fonction que lorsque self est disponible, pour intégrer la vue dans le body
    @ViewBuilder
    func imageView(for image: UIImage?) -> some View {
        if let image = image {
            ZStack {
                Rectangle().fill(SwiftUI.Color.white)
                GeometryReader { reader in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                        .clipped()
                }
                
            }
        }
        else {
            defaultImage
        }
    }
}

//struct GridLayout_Previews: PreviewProvider {
//    static var previews: some View {
//        GridLayout()
//
//    }
//}
