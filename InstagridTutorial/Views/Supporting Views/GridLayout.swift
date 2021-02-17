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
                if layoutViewModel.showTopLeftButton {
                    Button(action: {
                        imagePickerViewModel.sender = .topLeft
                        activeSheet = .pickImage
                    }) { imageView(for: imagePickerViewModel.selectedImageTopLeft) }
                }
                Button(action: {
                    imagePickerViewModel.sender = .topRight
                    activeSheet = .pickImage
                }) { imageView(for: imagePickerViewModel.selectedImageTopRight) }
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            HStack {
                Button(action: {
                    imagePickerViewModel.sender = .bottomLeft
                    activeSheet = .pickImage
                }) { imageView(for: imagePickerViewModel.selectedImageBottomLeft) }
                if layoutViewModel.showBottomRightButton {
                    Button(action: {
                        imagePickerViewModel.sender = .bottomRight
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
