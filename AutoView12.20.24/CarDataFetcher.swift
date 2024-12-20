//
//  CarDataFetcher.swift
//  AutoView12.20.24
//

import Foundation

// ObservableObject class to manage fetching car data
class CarDataFetcher: ObservableObject
{
    // Published property to hold the fetched car data
    @Published var carData: CarResponse?
    
    // Published property to hold any error messages encountered during data fetch
    @Published var errorMessage: String?
    
    // Function to fetch car data asynchronously from a given URL
    func fetchCarData(from urlString: String) async
    {
        // Validate the provided URL string and convert it to a URL object
        guard let url = URL(string: urlString) else
        {
            print("Invalid URL: \(urlString)")
            return
        }
        
        do
        {
            // Perform the network request to fetch data from the URL
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check if the HTTP response status code indicates success
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            {
                // Try decoding the received data into the CarResponse model
                if let decodedResponse = try? JSONDecoder().decode(CarResponse.self, from: data)
                {
                    // Update the carData property on the main thread
                    DispatchQueue.main.async
                    {
                        self.carData = decodedResponse
                    }
                }
                else
                {
                    // Handle decoding failure and update the errorMessage property
                    DispatchQueue.main.async
                    {
                        self.errorMessage = "Failed to decode car data from URL: \(urlString)"
                    }
                }
            }
            else
            {
                // Handle unsuccessful HTTP response status and update errorMessage
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
