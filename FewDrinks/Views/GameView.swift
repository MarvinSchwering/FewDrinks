//
//  GameView.swift
//  FewDrinks
//
//  Created by Schwering, Marvin, SEVEN PRINCIPLES on 09.10.21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    @State private var showGameView = false
    @State private var showRoundDoneView = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("grey").ignoresSafeArea()
                VStack {
                    player
                    question
                    choices
                }
            }.navigationBarHidden(true)
        }
    }
    
    var player : some View {
        Text(viewModel.getCurrentPlayerName()).bold()
    }
    
    var question : some View {
        Text("question")
    }
    
    var choices : some View {
        HStack(alignment: .top, spacing: 0) {
            NavigationLink("", destination: GameView()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true), isActive: $showGameView)
            NavigationLink("", destination: RoundDoneView()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true), isActive: $showRoundDoneView)
            Button(action: {
                viewModel.addChoice(choice: 0)
                if viewModel.roundDone() {
                    viewModel.calcDrinkers()
                    showRoundDoneView.toggle()
                } else {
                    showGameView.toggle()
                }
            }, label: {
                Text("")
            }).frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
                .ignoresSafeArea()
            Button(action: {
                viewModel.addChoice(choice: 1)
                if viewModel.roundDone() {
                    viewModel.calcDrinkers()
                    showRoundDoneView.toggle()
                } else {
                    showGameView.toggle()
                }
            }, label: {
                Text("")
            }).frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
                .ignoresSafeArea()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameViewModel())
    }
}
