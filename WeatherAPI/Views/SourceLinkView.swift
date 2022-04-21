//
//  SourceLinkView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/24/22.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 45, height: 40)
                .foregroundColor(.white.opacity(0.7))
            
            HStack(spacing: 2) {
                VStack {
                    Text("The")
                    Text("Weather")
                    Text("Channel")
                }
                .font(.system(size: 6))
                Link("➚", destination: URL(string: "https://weather.com/")!)
            }
            .foregroundColor(.gray)
        }
            
    }
}


struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
