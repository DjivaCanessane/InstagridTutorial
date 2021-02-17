//
//  ImagePickerViewModel.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 17/02/2021.
//

import SwiftUI

class ImagePickerViewModel: ObservableObject {
    @Published var selectedImageTopRight: UIImage?
    @Published var selectedImageTopLeft: UIImage?
    @Published var selectedImageBottomRight: UIImage?
    @Published var selectedImageBottomLeft: UIImage?

    var sender: Sender = .topLeft
    private(set) var sourceType: ImagePickerView.SourceType = .photoLibrary

    // CompletionHandler: affecte l'image choisi à sa case correspondante
    func didSelectImage(_ image: UIImage?) {
        switch sender {
        case .topLeft:
            selectedImageTopLeft = image
        case .topRight:
            selectedImageTopRight = image
        case .bottomLeft:
            selectedImageBottomLeft = image
        case .bottomRight:
            selectedImageBottomRight = image
        }
    }
}

enum Sender {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}
