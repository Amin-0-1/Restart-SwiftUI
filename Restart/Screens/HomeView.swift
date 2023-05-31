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
            // MARK: - Header
            Spacer()
            ZStack {
                Circle()
                    .stroke(.gray.opacity(0.1),lineWidth: 40)
                    .padding(.all,50)
                Circle()
                    .stroke(.gray.opacity(0.1),lineWidth: 80)
                    .padding(.all,50)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
            }.padding()
            Spacer()
            
            // MARK: - Center
            Text("""
                 The time that leads to mastery is
                 dependent on the intensity of our focus.
                 """
            )
            .font(.title3)
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            Spacer()
            // MARK: - Footer
            
            ZStack {
                Capsule()
                    .frame(width: 120, height: 50, alignment: .center)
                    .foregroundColor(Color("ColorBlue"))
                  
                HStack{
                    Image(systemName:"trash")
                        .scaledToFit()
                        .tint(.white)
                    Text("Restart")
                }
            }
            .onTapGesture {
                isOnboardingViewActive = false
            }
            .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
