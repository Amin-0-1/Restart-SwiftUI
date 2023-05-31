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
        ZStack {
            if isOnboardingViewActive{
                OnboardingView()
            }else{
                HomeView()
            }
        }
        .animation(.easeOut(duration: 0.5).delay(0), value: isOnboardingViewActive)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
