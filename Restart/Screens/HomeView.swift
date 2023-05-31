//
//  HomeView.swift
//  Restart
//
//  Created by Amin on 22/05/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("Onboarding") var isOnboardingViewActive = true
    var body: some View {
        VStack {
            Text("Hello view")
                .font(.largeTitle)
            Button {
                isOnboardingViewActive = true
            } label: {
                Text("Rest")
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
