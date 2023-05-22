//
//  OnboardingView.swift
//  Restart
//
//  Created by Amin on 22/05/2023.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("Onboarding") var isOnboardingViewActive = true
    var body: some View {
        VStack(spacing:20) {
            Text("OnBoarding")
                .font(.largeTitle)
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
