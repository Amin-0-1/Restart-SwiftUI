//
//  HomeView.swift
//  Restart
//
//  Created by Amin on 22/05/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("Onboarding") var isOnboardingViewActive = true
    @State private var isAnimating:Bool = false
    
    var body: some View {
        VStack {
            // MARK: - Header
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .secondary,shapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeOut(duration: 3).repeatForever(), value: isAnimating)
            }
            
            // MARK: - Center
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
            
            Spacer()
            
            // MARK: - Footer
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3,design: .default))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .offset(y: isAnimating ? 0 : 30)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1), value: isAnimating)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                isAnimating = true
            }
        } 
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
