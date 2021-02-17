//
//  MainView+ImageMethods.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 17/02/2021.
//

import SwiftUI

// Permet de convertir une view en UIView
extension UIView {
    func asImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
