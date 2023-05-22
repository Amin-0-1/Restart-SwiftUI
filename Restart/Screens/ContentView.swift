//
//  ContentView.swift
//  Restart
//
//  Created by Amin on 22/05/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Onboarding") var isOnboardingViewActive = true
    var body: some View {
        VStack {
            if isOnboardingViewActive{
                OnboardingView()
            }else{
                HomeView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
