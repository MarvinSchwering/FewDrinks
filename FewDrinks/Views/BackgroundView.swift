//
//  BackgroundView.swift
//  FewDrinks
//
//  Created by Mark Antonio Giovani on 16.10.21.
//

import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        ZStack {
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
