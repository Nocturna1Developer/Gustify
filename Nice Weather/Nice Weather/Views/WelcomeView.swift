//
//  WelcomeView.swift
//  Nice Weather
//
//  Created by m on 7/5/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                Text("Welcome to the weather App").bold().font(.title)
                
                Text("Please share your current location if you want to see the weather in your current area").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
