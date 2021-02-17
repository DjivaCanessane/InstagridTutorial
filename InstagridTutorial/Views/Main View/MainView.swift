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

    let headerView = HeaderView()
    let layoutButtons = LayoutButtons()

    var body: some View {
        let gridLayout = GridLayout(activeSheet: $activeSheet)
        
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            // Portrait mode
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
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
    }
}
// Cette énumaration nous permettra d'implémenter la fonctionnalité share facilement
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
