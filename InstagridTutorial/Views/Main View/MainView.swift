//
//  ContentView.swift
//  InstagridTutorial
//
//  Created by Djiveradjane Canessane on 16/02/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var imagePickerViewModel: ImagePickerViewModel

    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    @State var activeSheet: ActiveSheet?
    @State var verticalOffset: CGFloat = CGFloat.zero
    @State var horizontalOffset: CGFloat = CGFloat.zero

    let headerView = HeaderView()
    let layoutButtons = LayoutButtons()

    var body: some View {
        // On donne un offset au gridLayout pour qu'il change de position lors du swipe
        let gridLayout = GridLayout(activeSheet: $activeSheet)
            .offset(x: horizontalOffset, y: verticalOffset)
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            // Portrait mode
            if isPortraitMode() {
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
        .sheet(item: $activeSheet) { item in
            switch item {
            case .pickImage:
                ImagePickerView(
                    sourceType: imagePickerViewModel.sourceType,
                    completionHandler: { image in
                        imagePickerViewModel.didSelectImage(image)
                        self.activeSheet = nil
                    }
                )
            }
        }
        .gesture(DragGesture(minimumDistance: 3, coordinateSpace: .global)
                    .onEnded({ (value) in
                        // up swipe
                        if value.translation.height < 0 && isPortraitMode() {
                            // withAnimation créera automatiqument une animation pour la translation
                            withAnimation {
                                self.verticalOffset = -UIScreen.main.bounds.size.height
                            }
                        }
                        // left swipe
                        else if value.translation.width < 0 && !isPortraitMode() {
                            // withAnimation créera automatiqument une animation pour la translation
                            withAnimation {
                                self.horizontalOffset = -UIScreen.main.bounds.size.width
                            }
                        }
                    })
        )
    }

    private func isPortraitMode() -> Bool {
        return horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
}

enum ActiveSheet: Identifiable {
    case pickImage
    
    var id: Int {
        hashValue
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
