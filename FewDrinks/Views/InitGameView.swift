//
//  InitGameView.swift
//  FewDrinks
//
//  Created by Schwering, Marvin, SEVEN PRINCIPLES on 09.10.21.
//

import SwiftUI

struct InitGameView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    @State var playerName: String
    @State private var showGameView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        TextField("Name", text: $playerName)
                        Button(action: {
                            viewModel.players.append(playerName)
                            playerName = ""
                        }) {
                            Text("Add")
                        }
                    }
                    List {
                        ForEach(viewModel.players, id: \.self) { player in
                            Text(player.description)
                        }.onDelete(perform: self.deletePlayer)
                    }
                    NavigationLink("", destination: GameView()
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true), isActive: $showGameView)
                    Button(action: {
                        viewModel.initChoices()
                        showGameView.toggle()
                    }, label: {
                        Text("Start Game")
                    }).disabled(viewModel.players.isEmpty)
                }
            }.navigationBarHidden(true)
        }
    }
    
    private func deletePlayer(at indexSet: IndexSet) {
        viewModel.players.remove(atOffsets: indexSet)
    }
}

struct InitGameView_Previews: PreviewProvider {
    static var previews: some View {
        InitGameView(playerName: "")
            .environmentObject(GameViewModel())
    }
}

