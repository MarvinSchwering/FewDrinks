//
//  RoundDoneView.swift
//  FewDrinks
//
//  Created by Schwering, Marvin, SEVEN PRINCIPLES on 09.10.21.
//

import SwiftUI

struct RoundDoneView: View {
    
    
    @EnvironmentObject var viewModel: GameViewModel

    @State private var showGameView = false
    @State private var showInitGameView = false
    
    var body: some View {
        VStack {
            
            Text("Players who lost:")
            List {
                ForEach(viewModel.drinkers, id: \.self) { player in
                    Text(player.description)
                }
            }
            
            HStack {
                
                NavigationLink("", destination: InitGameView( playerName: "")
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true), isActive: $showInitGameView)
                NavigationLink("", destination: GameView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true), isActive: $showGameView)
                Button(action: {
                    showInitGameView.toggle()
                }, label: {
                    Text("Edit Players")
                })
                Button(action: {
                    showGameView.toggle()
                }, label: {
                    Text("Next Round")
                })
            }
        }
    }
}

struct RoundDoneView_Previews: PreviewProvider {
    static var previews: some View {
        RoundDoneView()
            .environmentObject(GameViewModel())
    }
}
