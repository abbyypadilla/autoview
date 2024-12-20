//  ContentView.swift
//  AutoView

import SwiftUI

struct ContentView: View {
    // State variables to manage the visibility of links for each car model
    @State private var showCivicLinks = false
    @State private var showCamryLinks = false
    @State private var showCX5Links = false
    @State private var show3SeriesLinks = false
    @State private var showX3Links = false
    @State private var showISLinks = false
    @State private var showRXLinks = false
    @State private var showDefenderLinks = false
    @State private var show911Links = false
    @State private var showGTRLinks = false
    @State private var showFilterPopup = false
    // Array for holding selected car model years
    @State private var selectedYears: [String] = []

    // Define the range of years available (2016 to 2025)
    let yearRange = Array(2016...2025).map { String($0) }

    var body: some View {
        NavigationView {
            ZStack {
                // Background image of the app
                Image("AutoViewAppBasic")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    // Title of the screen
                    Text("All Cars")
                        .font(.custom("Georgia", size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .padding()
                        .background(Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                        .cornerRadius(8)

                    ScrollView {
                        VStack(spacing: 20) {
                            // Group of car models for the first section
                            Group {
                                createButtonSection(
                                    title: "Honda Civic",
                                    showLinks: $showCivicLinks,
                                    links: HondaCivicLinks,
                                    imageName: "hondacivic"
                                )

                                createButtonSection(
                                    title: "Toyota Camry",
                                    showLinks: $showCamryLinks,
                                    links: ToyotaCamryLinks,
                                    imageName: "toyotacamry"
                                )
                            }

                            Divider()

                            // Group of car models for the second section
                            Group {
                                createButtonSection(
                                    title: "Mazda CX-5",
                                    showLinks: $showCX5Links,
                                    links: MazdaCX5Links,
                                    imageName: "mazdacx5"
                                )

                                createButtonSection(
                                    title: "BMW 3 Series",
                                    showLinks: $show3SeriesLinks,
                                    links: Bmw3SeriesLinks,
                                    imageName: "bmw3series"
                                )
                            }

                            Divider()

                            // Group of car models for the third section
                            Group {
                                createButtonSection(
                                    title: "BMW X3",
                                    showLinks: $showX3Links,
                                    links: BmwX3Links,
                                    imageName: "bmwx3"
                                )

                                createButtonSection(
                                    title: "Lexus IS",
                                    showLinks: $showISLinks,
                                    links: LexusISLinks,
                                    imageName: "lexusis"
                                )
                            }

                            Divider()

                            // Group of car models for the fourth section
                            Group {
                                createButtonSection(
                                    title: "Lexus RX",
                                    showLinks: $showRXLinks,
                                    links: LexusRXLinks,
                                    imageName: "lexusrx"
                                )

                                createButtonSection(
                                    title: "Land Rover Defender",
                                    showLinks: $showDefenderLinks,
                                    links: LandRoverDefenderLinks,
                                    imageName: "landroverdefender"
                                )
                            }

                            Divider()

                            // Group of car models for the fifth section
                            Group {
                                createButtonSection(
                                    title: "Porsche 911",
                                    showLinks: $show911Links,
                                    links: Porsche911Links,
                                    imageName: "porsche911"
                                )

                                createButtonSection(
                                    title: "Nissan GTR",
                                    showLinks: $showGTRLinks,
                                    links: NissanGTRLinks,
                                    imageName: "nissangtr"
                                )
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }

                    Spacer()

                    // Button to show the filter popup
                    Button(action: {
                        showFilterPopup = true
                    }) {
                        Text("Filter by Year")
                            .font(.custom("Georgia", size: 20))
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                            .cornerRadius(0)
                    }
                    .padding(.bottom, 40)
                }

                // Display the filter popup if showFilterPopup is true
                if showFilterPopup {
                    ZStack {
                        // Semi-transparent background to dim the screen
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()

                        VStack {
                            Text("Select a Year")
                                .font(.custom("Georgia", size: 25))
                                .padding()

                            // Scrollable horizontal list of years for selection
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(yearRange, id: \.self) { year in
                                        Button(action: {
                                            toggleYearSelection(year)
                                        }) {
                                            Text(year)
                                                .font(.title3)
                                                .padding()
                                                .foregroundColor(.white)
                                                .background(selectedYears.contains(year) ? Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255) : Color(red: 71 / 255, green: 67 / 255, blue: 68 / 255))
                                                .cornerRadius(8)
                                        }
                                    }
                                }
                                .padding()
                            }

                            // Button to clear the selected years filter
                            Button(action: {
                                selectedYears.removeAll()
                                showFilterPopup = false
                            }) {
                                Text("Clear Filter")
                                    .font(.custom("Georgia", size: 18))
                                    .padding()
                                    .foregroundColor(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                                    .background(Color(red: 228 / 255, green: 253 / 255, blue: 225 / 255))
                                    .cornerRadius(8)
                            }
                            .padding(.top)

                            // Button to close the filter popup
                            Button(action: {
                                showFilterPopup = false
                            }) {
                                Text("Close")
                                    .font(.custom("Georgia", size: 18))
                                    .padding()
                                    .foregroundColor(Color(red: 228 / 255, green: 253 / 255, blue: 225 / 255))
                                    .background(Color(red: 69 / 255, green: 105 / 255, blue: 144 / 255))
                                    .cornerRadius(8)
                            }
                            .padding(.top)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                    }
                }
            }
        }
    }

    // Function to toggle year selection
    private func toggleYearSelection(_ year: String) {
        if selectedYears.contains(year) {
            selectedYears.removeAll { $0 == year }
        } else {
            selectedYears.append(year)
        }
    }

    // Function to create button sections for each car model
    func createButtonSection(title: String, showLinks: Binding<Bool>, links: [String], imageName: String) -> some View {
        VStack {
            // Image for the car model
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(8)
                .padding(.bottom, 10)

            // Button to show/hide the car links
            Button(action: {
                withAnimation {
                    showLinks.wrappedValue.toggle()
                }
            }) {
                Text(title)
                    .font(.custom("Georgia", size: 28))
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 0.894, green: 0.992, blue: 0.882))
                    .cornerRadius(0)
            }

            // Show the car model links if showLinks is true
            if showLinks.wrappedValue {
                ForEach(links.filter { link in
                    guard !selectedYears.isEmpty else { return true }
                    return selectedYears.contains(getYear(from: link))
                }, id: \.self) { link in
                    NavigationLink(destination: CarDataView(urlString: link)) {
                        Text("\(title) \(getYear(from: link))")
                            .font(.custom("Georgia", size: 20))
                            .padding()
                            .foregroundColor(.blue)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 5)
                }
            }
        }
    }

    // Helper function to extract the year from a URL
    func getYear(from url: String) -> String {
        let components = url.split(separator: "&")
        for component in components {
            if component.contains("ymmt=") {
                let yearComponent = component.split(separator: "%7C")[0]
                if let yearString = yearComponent.split(separator: "=").last {
                    let cleanedYear = yearString.filter { $0.isNumber }
                    if let year = Int(cleanedYear) {
                        return String(year)
                    }
                }
            }
        }
        return "Unknown Year"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
