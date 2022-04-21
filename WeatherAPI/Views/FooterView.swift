////
////  Footer.swift
////  WeatherAPI
////
////  Created by Mark Skurat on 3/23/22.
////
//
//import SwiftUI
//
//struct FooterView: View {
//    @StateObject var vm = WeatherAPIViewModel()
//
//    @State var header1: String
//    @State var text1: String
//
//    @State var header2: String
//    @State var text2: String
//
//    var body: some View {
//        ZStack {
//            VStack {
//                Divider()
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text(header1.uppercased())
//                            .foregroundColor(.white.opacity(0.6))
//                        Text(text1)
//                            .font(.title)
//                    }
//                    Spacer()
//                    VStack(alignment: .leading) {
//                        Text(header2.uppercased())
//                            .foregroundColor(.white.opacity(0.6))
//                        Text(text2)
//                            .font(.title)
//                    }
//
//                }
//
//            }
//            .padding(.horizontal, 20)
//            .foregroundColor(.white)
//        }
//    }
//}
//
//struct Footer_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        FooterView(header1: "Sunrise", text1: "6:53AM", header2: "Sunset", text2: "7:11PM")
//            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.dark)
//    }
//}
