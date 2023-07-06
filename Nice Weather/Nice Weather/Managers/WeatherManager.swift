/*
--------------------------------------------------------------------------------------
Summary:
The script defines a class "WeatherManager" that has a method to make an HTTP request to
the OpenWeather API. It fetches current weather data based on the provided coordinates.

The response from the API is then parsed into a Swift structure "ResponseBody" which
includes several nested structures for different pieces of weather data like coordinates,
main weather, wind conditions, etc.

The 'ResponseBody.MainResponse' structure also includes an extension that provides
more Swift-like property names.

--------------------------------------------------------------------------------------
*/

import Foundation
import CoreLocation

// This class handles retrieving weather data.
class WeatherManager {
    // Method to get the current weather data. It's an asynchronous method that can throw errors.
    // It takes latitude and longitude as parameters and returns the ResponseBody structure.
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        // Constructs the API URL with provided latitude and longitude.
        // In case of an error while creating the URL, the app will crash with the "Missing URL" message.
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("edfadc26111e2be09ece92ed446e6629")&units=metric") else { fatalError("Missing URL") }

        // Creates a URLRequest with the constructed URL.
        let urlRequest = URLRequest(url: url)
        
        // Sends the HTTP request and waits for a response.
        // URLSession.shared.data(for:) is an async method that suspends until it receives the response.
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Checks if the response has a status code of 200 (HTTP OK). If not, the app will crash with the "Error while fetching data" message.
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        // Tries to decode the received data into the ResponseBody structure.
        // If the data doesn't match the structure, the method will throw an error.
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        // Returns the decoded data.
        return decodedData
    }
}

// The structure of the body of the response we get from the OpenWeather API.
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    // Represents the coordinates in the response body.
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    // Represents the weather data in the response body.
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    // Represents the main weather data in the response body.
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    // Represents the wind data in the response body.
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

// This extension adds computed properties to MainResponse structure to convert snake_case property names into camelCase.
extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
