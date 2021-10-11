//
//  GameViewModel.swift
//  FewDrinks
//
//  Created by Schwering, Marvin, SEVEN PRINCIPLES on 09.10.21.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject {
    
    @Published var questions : [Question] = []
    
    //current players.
    @Published var players : [String] = []
    
    //choices of players according to player order.
    private var choices : [Int] = []
    
    //players to be drinking
    @Published var drinkers : [String] = []
    
    //current player index
    private var currPlayer : Int = 0
    
    func getCurrentPlayerName() -> String {
        if players.isEmpty {
            return "no Players available"
        } else {
            return players[currPlayer]
        }
    }
    
    func addPlayer(player : String) {
        players.append(player)
    }
    
    func initChoices() {
        while choices.count < players.count {
            choices.append(0)
        }
    }
    
    func nextPlayer() {
        currPlayer = (currPlayer + 1) % players.count
    }
    
    func roundDone() -> Bool {
        return currPlayer == 0
    }
    
    func addChoice(choice : Int) {
        choices[currPlayer] = choice
        nextPlayer()
    }
    
    func calcDrinkers() {
        var c0 : [String] = []
        var c1 : [String] = []
        var i : Int = 0
        while i < players.count {
            if choices[i] == 0 {
                c0.append(players[i])
            } else {
                c1.append(players[i])
            }
            i += 1
        }
        if c0.count > c1.count {
            drinkers = c1
        } else if c1.count > c0.count {
            drinkers = c0
        } else {
            drinkers = []
        }
    }
}
