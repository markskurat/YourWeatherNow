//
//  DescriptionView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/23/22.
//

import SwiftUI

struct DescriptionView: View {
    
    @StateObject var vm = WeatherAPIViewModel()
    var body: some View {
        VStack {
            
            let descrip = Main(String(vm.current?.weather?.first?.main ?? ""))
            
            Text("Today: \(descrip.mainDescription()) conditions with \(vm.current?.wind_speed?.roundDouble() ?? "") mph winds. The high will be \(vm.days.first?.temp?.max?.roundDouble() ?? "")° and the low \(vm.days.first?.temp?.min?.roundDouble() ?? "")°.")
                .font(.headline)
        }
        .padding(.horizontal, 20)
    }

}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
