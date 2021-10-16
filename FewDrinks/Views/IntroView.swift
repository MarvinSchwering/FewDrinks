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
    
    // For responsive size
    @ScaledMetric var size: CGFloat = 1
    
    var width: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIScreen.main.bounds.width * 0.9
        } else {
            return UIScreen.main.bounds.width * 0.4
        }
    }
    
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
            }).foregroundColor(Color.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10.0)
                    .frame(maxWidth: .infinity)
            

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
