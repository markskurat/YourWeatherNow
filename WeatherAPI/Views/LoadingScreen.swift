//
//  LoadingScreen.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/22/22.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
