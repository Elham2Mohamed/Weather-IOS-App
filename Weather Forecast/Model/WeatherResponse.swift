//
//  WeatherResponse.swift
//  Weather Forecast
//
//  Created by Elham on 17/05/2024.
//

import Foundation


// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?
}

// MARK: - Current
struct Current: Codable, Identifiable {
    let id = UUID()
    let lastUpdated: String?
    let tempC: Double?
    let isDay: Int?
    let condition: Condition?
    let pressureMB, humidity, feelslikeC, visKM: Double?

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case pressureMB = "pressure_mb"
        case humidity, id
        case feelslikeC = "feelslike_c"
        case visKM = "vis_km"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String?
    let code: Int?
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable, Identifiable {
    let id = UUID()
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?
    let hour: [Hour]?
    
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, mintempC: Double?
    let condition: Condition?
    enum CodingKeys: String, CodingKey {
        case condition
        case mintempC = "mintemp_c"
        case maxtempC = "maxtemp_c"
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase: String?
    let moonIllumination: Int?
    let isMoonUp, isSunUp: Int?
    
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

// MARK: - Hour
struct Hour: Codable, Identifiable {
    let id = UUID()
    let time: String?
    let tempC: Double?
    let isDay: Int?
    let condition: Condition?
    let pressureMB, humidity, feelslikeC, visKM: Double?
    
    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case pressureMB = "pressure_mb"
        case humidity, feelslikeC
        case visKM = "vis_km"
    }
}

