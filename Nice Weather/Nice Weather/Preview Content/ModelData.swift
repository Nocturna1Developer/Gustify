/*
--------------------------------------------------------------------------------------
Summary:
This script loads a JSON file named "WeatherData.json" from the app's main bundle and decodes
it into an instance of 'ResponseBody'. It uses a generic function 'load(_:)' to load and parse
the JSON file.
--------------------------------------------------------------------------------------
*/

import Foundation

// This line initializes 'previewWeather' by loading and parsing 'WeatherData.json' into an instance of 'ResponseBody'.
var previewWeather: ResponseBody = load("WeatherData.json")

// The 'load' function is a generic function that loads and parses a JSON file from the app's main bundle.
// It can be used with any type 'T' that conforms to the 'Decodable' protocol.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // Attempts to find the requested file in the app's main bundle.
    // If the file can't be found, this line will trigger a fatal error with an explanation.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    // Attempts to load the file's contents as 'Data'.
    // If this fails, it will trigger a fatal error with an explanation.
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    // Attempts to parse the 'Data' into an instance of the requested type 'T'.
    // If this fails, it will trigger a fatal error with an explanation.
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
