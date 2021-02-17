//
//  ImagePickerView.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 17/02/2021.
//

import SwiftUI
import UIKit

// On crée le ImagePickerView à partir du UIImageViewController,
// pour cela nous devons impllémenter le protocol UIViewControllerRepresentable
struct ImagePickerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias SourceType = UIImagePickerController.SourceType

    let sourceType: SourceType
    let completionHandler: (UIImage?) -> Void

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let viewController = UIImagePickerController()
        viewController.delegate = context.coordinator
        viewController.sourceType = sourceType
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(completionHandler: completionHandler)
    }
}

// Le rôle du Coordinator est de nous permettre de donner un completionHandler,
// pour donner des instruction après avoir choisi ou non une image
final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let completionHandler: (UIImage?) -> Void

    init(completionHandler: @escaping (UIImage?) -> Void) {
        self.completionHandler = completionHandler
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image: UIImage? = {
            if let image = info[.editedImage] as? UIImage {
                return image
            }
            return info[.originalImage] as? UIImage
        }()
        completionHandler(image)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        completionHandler(nil)
    }
}
