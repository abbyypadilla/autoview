//
//  ModelYearList.swift
//  AutoView12.20.24
//

import SwiftUI

struct ModelYearList: View
{
    let carModel: String
    let availableYears: [String]
    
    var body: some View
    {
        VStack
        {
            // Honda Civic Links
            ForEach(HondaCivicLinks, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Honda Civic \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // Toyota Camry Links
            ForEach(ToyotaCamryLinks, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Toyota Camry \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // Mazda CX5 Links
            ForEach(MazdaCX5Links, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Mazda CX5 \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // BMW 3 Series Links
            ForEach(Bmw3SeriesLinks, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("BMW 3 Series \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // BMW X3 Links
            ForEach(BmwX3Links, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("BMW X3 \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // Lexus IS Links
            ForEach(LexusISLinks, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Lexus IS \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // Lexus RX Links
            ForEach(LexusRXLinks, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Lexus RX \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // Land Rover Defender Links
            ForEach(LandRoverDefenderLinks, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Land Rover Defender \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // Porsche 911 Links
            ForEach(Porsche911Links, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Porsche 911 \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
            
            // Nissan GTR Links
            ForEach(NissanGTRLinks, id: \.self)
            { link in
                NavigationLink(destination: CarDataView(urlString: link))
                {
                    Text("Nissan GTR \(getYear(from: link))")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            }
        }
    }

    func getYear(from url: String) -> String
    {
        let components = url.split(separator: "&")
        for component in components
        {
            if component.contains("ymmt=")
            {
                let yearComponent = component.split(separator: "%7C")[0]
                if let yearString = yearComponent.split(separator: "=").last
                {
                    let cleanedYear = yearString.filter { $0.isNumber }
                    if let year = Int(cleanedYear)
                    {
                        return String(year)
                    }
                }
            }
        }
        return "Unknown Year"
    } // end func
}
