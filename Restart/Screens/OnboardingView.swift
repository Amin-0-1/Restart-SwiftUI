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
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack (spacing: 20){
                // MARK: - Header
                Spacer()
                VStack(spacing:0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                    
                    Text("""
                         It's not how much we give but
                         how much love we put into giving.
                        """
                    )
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                }.foregroundColor(.white)
                
                // MARK: - Center
                
                ZStack {
                    CircleGroupView(shapeColor: .white,shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                
                // MARK: - Footer
                ZStack{
                    // Parts of the custom button
                    
                    // 1. Background (Static)
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    
                    // 2. Call-to-action (static)
                    Text("Get Started")
                        .font(.system(.title3,design: .default))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    
                    
                    // 3. Capsule (Dynamic width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80, alignment: .leading)
                        
                        Spacer()
                        
                    }
                    // 4. Circle (Draggable )
                    
                    HStack {
                        ZStack{
                            Capsule()
                                .fill(Color("ColorRed"))

                            Capsule()
                                .fill(.black.opacity(0.15))
                                .padding(8)

                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        Spacer()
                    }
                }
                .frame(height: 80,alignment: .center)
                .padding()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
