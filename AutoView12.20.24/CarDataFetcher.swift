//
//  CarDataFetcher.swift
//  AutoView12.20.24
//

import Foundation

// ObservableObject class to manage fetching car data
class CarDataFetcher: ObservableObject
{
    // Published property: hold fetched car data
    @Published var carData: CarResponse?
    
    // Published property: hold any error messages encountered during data fetch
    @Published var errorMessage: String?
    
    // Func: fetch car data asynchronously from URL
    func fetchCarData(from urlString: String) async
    {
        // Validate provided URL string, convert to URL object
        guard let url = URL(string: urlString) else
        {
            print("Invalid URL: \(urlString)")
            return
        }
        
        do
        {
            // Perform network request to fetch data from URL
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check if the HTTP response status code indicates success
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            {
                if let decodedResponse = try? JSONDecoder().decode(CarResponse.self, from: data)
                {
                    // Update carData property
                    DispatchQueue.main.async
                    {
                        self.carData = decodedResponse
                    }
                }
                else
                {
                    // Handle any decoding failure, update the errorMessage property
                    DispatchQueue.main.async
                    {
                        self.errorMessage = "Failed to decode car data from URL: \(urlString)"
                    }
                }
            }
            else
            {
                // Handle any unsuccessful HTTP response status, update errorMessage
                DispatchQueue.main.async
                {
                    self.errorMessage = "Failed to fetch data. Status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)"
                }
            }
        }
        catch
        {
            // Handle any errors during the network request and update errorMessage
            DispatchQueue.main.async
            {
                self.errorMessage = "Error fetching data from URL: \(urlString) - \(error.localizedDescription)"
            }
        }
    }
}
