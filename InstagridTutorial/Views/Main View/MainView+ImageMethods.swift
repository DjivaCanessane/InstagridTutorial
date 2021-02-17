//
//  MainView+ImageMethods.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 17/02/2021.
//

import SwiftUI

// Extension for checking presence of image in the gridLayout
extension MainView {
    // Vérification pour la première configuration
    private var isFirstLayoutButtonSelected: Bool {
        return layoutViewModel.showBottomRightButton && !layoutViewModel.showTopLeftButton
    }
    
    private var isContainingImageForFirstLayoutButton: Bool {
        return imagePickerViewModel.selectedImageTopRight != nil
            || imagePickerViewModel.selectedImageBottomRight != nil
            || imagePickerViewModel.selectedImageBottomLeft != nil
    }
    
    // Vérification pour la seconde configuration
    private var isSecondLayoutButtonSelected: Bool {
        return !layoutViewModel.showBottomRightButton && layoutViewModel.showTopLeftButton
    }
    
    private var isContainingImageForSecondLayoutButton: Bool {
        return imagePickerViewModel.selectedImageTopRight != nil
            || imagePickerViewModel.selectedImageTopLeft != nil
            || imagePickerViewModel.selectedImageBottomLeft != nil
    }
    
    // Vérification pour la troisième configuration
    private var isThirdLayoutButtonSelected: Bool {
        return layoutViewModel.showBottomRightButton && layoutViewModel.showTopLeftButton
    }
    
    private var isContainingImageForThirdLayoutButton: Bool {
        return imagePickerViewModel.selectedImageTopRight != nil
            || imagePickerViewModel.selectedImageTopLeft != nil
            || imagePickerViewModel.selectedImageBottomRight != nil
            || imagePickerViewModel.selectedImageBottomLeft != nil
    }
    
    func isShowingAtLeastOneImage() -> Bool {
        var isShowing: Bool = false
        // Check presence of image for the first LayoutButton configuration
        if isFirstLayoutButtonSelected {
            if isContainingImageForFirstLayoutButton {
                isShowing = true
            }
        }
        // Check presence of image for the second LayoutButton configuration
        else if isSecondLayoutButtonSelected {
            if isContainingImageForSecondLayoutButton {
                isShowing = true
            }
        }
        // Check presence of image for the third LayoutButton configuration
        else if isThirdLayoutButtonSelected {
            if isContainingImageForThirdLayoutButton {
                isShowing = true
            }
        }
        return isShowing
    }
}

// Permet de convertir une view en UIView
extension UIView {
    func asImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
