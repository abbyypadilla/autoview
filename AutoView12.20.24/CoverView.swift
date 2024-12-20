//
//  CoverView.swift
//  AutoView12.20.24
//

import SwiftUI

// Cover page
struct CoverPageView: View
{
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Spacer()
                
                // App title
                Text("AutoView")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))
                    .padding()

                // Car icon
                Image(systemName: "car.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(red: 0.81, green: 0.68, blue: 0.91))
                    .padding()

                Spacer()

                // Button navigating to the content view
                NavigationLink(destination: ContentView())
                {
                    Text("View Cars")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.81, green: 0.68, blue: 0.91))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationBarHidden(true)
        }
    }
}

struct CoverPageView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CoverPageView()
    }
}
