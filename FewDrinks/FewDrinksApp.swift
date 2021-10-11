//
//  FewDrinksApp.swift
//  FewDrinks
//
//  Created by Schwering, Marvin, SEVEN PRINCIPLES on 09.10.21.
//

import SwiftUI

@main
struct FewDrinksApp: App {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            IntroView()
                .environmentObject(viewModel)
        }
    }
}
