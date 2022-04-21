//
//  CityRowView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/24/22.
//

import SwiftUI

struct CityRowView: View {
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("4:01 PM")
                        .font(.system(size: 15, design: .monospaced))
                        
                    Text("Toms River")
                        .font(.system(size: 30))
                }
                Spacer()
                Text("48°")
                    .font(.system(size: 65))
                
            }
    }
}

struct CityRowView_Previews: PreviewProvider {
    static var previews: some View {
        CityRowView()
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
