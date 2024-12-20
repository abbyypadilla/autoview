//
//  CarResponse.swift
//  AutoView12.20.24
//

import Foundation

// Decodable models for the API response
struct CarResponse: Decodable {
    var count: Int
    var cpo: Int
    var non_cpo: Int
    var inventory_type: String
    var make: String
    var model: String
    var year: Int
    var trim: String
    var dom_stats: Stats
    var price_stats: Stats
}

struct Stats: Decodable {
    var geometric_mean: Double
    var min: Int
    var median: Int
    var population_standard_deviation: Double
    var variance: Double
    var max: Int
    var mean: Double
    var trimmed_mean: Double
    var standard_deviation: Double
    var iqr: Int
}
