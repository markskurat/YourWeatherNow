//
//  HeaderView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/23/22.
//

import SwiftUI

struct HeaderView: View {
    
    @StateObject var vm = WeatherAPIViewModel()
    @StateObject var vmm = CityNameViewModel()
    
    var body: some View {
        VStack {
            Text(vmm.city?.name ?? "")
                .font(.largeTitle)
                .padding(.vertical, 2)
            
            let descrip = Main(String(vm.current?.weather?.first?.main ?? ""))
            Text(descrip.mainDescription())
            
            Text(String(vm.current?.temp?.roundDouble() ?? "") + "°")
                .font(.system(size: 100, weight: .light))
                .offset(x: 8)
                        
            HStack {
                HStack {
                    Text("H:")
                }
                HStack {
                }
                HStack {
                    Text(String(vm.days.first?.temp?.max?.roundDouble() ?? "") + "°")
                }
                
                
                HStack {
                    Text("L:")
                }
                HStack {
                }
                HStack {
                    Text(String(vm.days.first?.temp?.min?.roundDouble() ?? "") + "°")
                }
                
                
                
            }
        }
       
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
