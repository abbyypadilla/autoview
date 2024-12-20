//
//  CarDataView.swift
//  AutoView12.20.24
//

import SwiftUI

struct CarDataView: View {
    // Environment property to handle view dismissal.
    @Environment(\.presentationMode) var presentationMode
    
    // State object for fetching car data from a remote source.
    @StateObject private var carFetcher = CarDataFetcher()
    
    // State variable to store the URL string for fetching car data.
    @State private var urlString: String

    var body: some View {
        ZStack {
            // Background image setup using GeometryReader for responsive sizing.
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

                    // Button to go back to the previous view.
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back to All Cars")
                            .font(.custom("Georgia", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                            .cornerRadius(8) // Rounded corners for the button.
                    }
                }

                // If car data is available, display it in a list.
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
                    .scrollContentBackground(.hidden) // Hides the default background of the list.
                    .background(Color.clear) // Makes the list background transparent.
                }
                // If there's an error fetching data, display the error message.
                else if let error = carFetcher.errorMessage {
                    Text(error)
                        .foregroundColor(Color(red: 228 / 255, green: 253 / 255, blue: 225 / 255))
                        .padding()
                        .background(Color.red) // Red background to indicate an error.
                        .cornerRadius(8)
                }
                // If data is still loading, show a progress view.
                else {
                    ProgressView("Loading car data...")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .navigationBarHidden(true) // Hides the default navigation bar.
            .task {
                await carFetcher.fetchCarData(from: urlString) // Fetch car data asynchronously when the view appears.
            }
        }
    }

    // Initializer to set the URL string for data fetching.
    init(urlString: String) {
        self._urlString = State(initialValue: urlString)
    }
}



//
//import SwiftUI
//
//// Display detailed car data
//struct CarDataView: View
//{
//    // Dismissing the view
//    @Environment(\.presentationMode) var presentationMode
//    // Manages car data fetching
//    @StateObject private var carFetcher = CarDataFetcher()
//    // URL to fetch data from
//    @State private var urlString: String
//
//    var body: some View
//    {
//        ZStack
//        {
//            // Background image setup
//            GeometryReader { geometry in
//                Image("AutoViewAppBasic")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: geometry.size.width, height: geometry.size.height)
//                    .clipped()
//            }
//            .ignoresSafeArea()
//
//            // Main content layout
//            VStack(spacing: 20)
//            {
//                // Header and Back button
//                VStack(spacing: 10)
//                {
//                    Text("Car Data")
//                        .font(.custom("Georgia", size: 35))
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .padding(.bottom, 10)
//                        .background(Color(red: 71/255, green: 67/255, blue: 68/255))
//                        .frame(maxWidth: .infinity)
//
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    })
//                    {
//                        Text("Back to All Cars")
//                            .font(.custom("Georgia", size: 20))
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color(red: 71/255, green: 67/255, blue: 68/255))
//                            .cornerRadius(8)
//                    }
//                }
//
//                // Display car details or error/loading state
//                if let car = carFetcher.carData
//                {
//                    // List of car details
//                    List
//                    {
//                        Text("Trim: \(car.trim)")
//                        Text("Make: \(car.make)")
//                        Text("Model: \(car.model)")
//                        Text("Year: \(car.year)")
//                        Text("Mean Price: \(car.price_stats.mean, specifier: "%.2f")")
//                        Text("Standard Deviation: \(car.price_stats.standard_deviation, specifier: "%.2f")")
//                    }
//                    .foregroundColor(.white)
//                    .font(.custom("Georgia", size: 15))
//                    .listRowBackground(Color(red: 69/255, green: 105/255, blue: 144/255))
//                    .scrollContentBackground(.hidden)
//                    .background(Color.clear)
//                }
//                else if let error = carFetcher.errorMessage
//                {
//                    // Display error message
//                    Text(error)
//                        .foregroundColor(Color(red: 69/255, green: 105/255, blue: 144/255))
//                        .padding()
//                        .background(Color.red)
//                        .cornerRadius(8)
//                }
//                else
//                {
//                    // Loading indicator
//                    ProgressView("Loading car data...")
//                        .foregroundColor(.white)
//                        .padding()
//                }
//            }
//            .navigationBarHidden(true)
//            .task {
//                // Trigger data fetch
//                await carFetcher.fetchCarData(from: urlString)
//            }
//        }
//    }
//
//    // Initialize the view with the URL string
//    init(urlString: String)
//    {
//        self._urlString = State(initialValue: urlString)
//    }
//}
