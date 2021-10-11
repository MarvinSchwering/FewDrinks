//
//  IntroView.swift
//  FewDrinks
//
//  Created by Schwering, Marvin, SEVEN PRINCIPLES on 09.10.21.
//

import SwiftUI

struct IntroView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    // Navigate to game view
    @State private var showGameView = false
    
    var body: some View {
        NavigationView {
            ZStack {
            NavigationLink("", destination: InitGameView(playerName: "")
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true), isActive: $showGameView)
            Button(action: {
                showGameView.toggle()
            }, label: {
                Text("New Game")
            })
            

            }.navigationBarHidden(true)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .environmentObject(GameViewModel())
    }
}
