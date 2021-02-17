//
//  RectGetter.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 17/02/2021.
//  Inspired by: https://stackoverflow.com/questions/57200521/how-to-convert-a-view-not-uiview-to-an-image/57206207#57206207

import SwiftUI

// Permet de creer un rectangle transparent en arriere plan, pour obtenir les dimension du GridLayout
struct RectGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { proxy in
            self.createView(proxy: proxy)
        }
    }

    func createView(proxy: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = proxy.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}
