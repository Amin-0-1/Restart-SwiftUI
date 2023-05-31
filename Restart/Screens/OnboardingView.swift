//
//  OnboardingView.swift
//  Restart
//
//  Created by Amin on 22/05/2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    @AppStorage("Onboarding") var isOnboardingViewActive = true
    @State private var buttonWidht:Double = UIScreen.main.bounds.width  - 80
    @State private var buttonOffset:CGFloat = 0
    @State private var isAnimating = false
    
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
                }
                .foregroundColor(.white)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - Center
                
                ZStack {
                    CircleGroupView(shapeColor: .white,shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
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
                    
                    
                    
                    
                    // 3. Capsule (Dynamic width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80, alignment: .center)
                        
                        Spacer()
                        
                    }
                    
                    // 2. Call-to-action (static)
                    Text("Get Started")
                        .font(.system(.title3,design: .default))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if value.translation.width > 0{
                                        buttonOffset = min(buttonWidht - 80, value.translation.width)
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 1)) {
                                        if buttonOffset > buttonWidht / 2 {
                                            buttonOffset = buttonWidht - 80
                                            isOnboardingViewActive = false
                                        }else{
                                            buttonOffset = 0
                                        }
                                    }
                                })
                                   
                        )
                        Spacer()
                    }
                }
                .frame(width: buttonWidht,height: 80)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)

            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
