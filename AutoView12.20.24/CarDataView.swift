//
//  CarDataView.swift
//  AutoView12.20.24
//

import SwiftUI

struct CarDataView: View {
    // Environment property: handle view dismissal
    @Environment(\.presentationMode) var presentationMode
    
    // State object: fetching car data from a remote source.
    @StateObject private var carFetcher = CarDataFetcher()
    
    // State variable: store URL string for fetching car data
    @State private var urlString: String

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("AutoViewAppBasic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .ignoresSafeArea()

            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("Car Data")
                        .font(.custom("Georgia", size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                        .background(Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                        .frame(maxWidth: .infinity)

                    // Button to go back to previous view
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back to All Cars")
                            .font(.custom("Georgia", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                            .cornerRadius(8)
                    }
                    
                }

                // If car data available, display in a list
                if let car = carFetcher.carData {
                    List {
                        Text("Trim: \(car.trim)")
                            .foregroundColor(.white)
                            .font(.custom("Georgia", size: 17))
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                        
                        Text("Make: \(car.make)")
                            .foregroundColor(.white)
                            .font(.custom("Georgia", size: 17))
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                        
                        Text("Model: \(car.model)")
                            .foregroundColor(.white)
                            .font(.custom("Georgia", size: 17))
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                        
                        Text("Year: \(car.year)")
                            .foregroundColor(.white)
                            .font(.custom("Georgia", size: 17))
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                        
                        Text("Mean Price: \(car.price_stats.mean, specifier: "%.2f")")
                            .foregroundColor(.white)
                            .font(.custom("Georgia", size: 17))
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                        
                        Text("Standard Deviation: \(car.price_stats.standard_deviation, specifier: "%.2f")")
                            .foregroundColor(.white)
                            .font(.custom("Georgia", size: 17))
                            .listRowBackground(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
                // If error fetching data, display error message
                else if let error = carFetcher.errorMessage {
                    Text(error)
                        .foregroundColor(Color(red: 228 / 255, green: 253 / 255, blue: 225 / 255))
                        .padding()
                        .background(Color.red)
                        .cornerRadius(8)
                }
                // If data still loading, show progress view
                else {
                    ProgressView("Loading car data...")
                        .foregroundColor(.white)
                        .padding()
                }
                
            }
            .navigationBarHidden(true)
            .task {
                await carFetcher.fetchCarData(from: urlString)
            }
        }
    }

    // Initializer: set the URL string for data fetching
    init(urlString: String) {
        self._urlString = State(initialValue: urlString)
    }
}
