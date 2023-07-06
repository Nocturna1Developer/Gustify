/*
--------------------------------------------------------------------------------------
Summary:
This Swift UI script defines a `WeatherRow` struct which is a custom view that displays
weather information in a horizontal layout.

Each row contains an icon, a name (description of the weather information),
and a value (the actual weather information). This information is provided
to the `WeatherRow` view via properties.

The body of `WeatherRow` is a horizontal stack (`HStack`) containing an image and a
vertical stack (`VStack`). The `VStack` contains two text views: one for the name
and one for the value.

`WeatherRow_Previews` is used to provide a preview of `WeatherRow` with hardcoded values.
---------------------------------------------------------------------------------------
*/

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    // The body of the view is a horizontal stack (`HStack`) containing an image and a vertical stack (`VStack`).
    var body: some View {
        HStack(spacing: 20) {
            // This is the logo image that's displayed in the row.
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)

            // This is a vertical stack (`VStack`) that contains two text views: one for the name and one for the value.
            VStack(alignment: .leading, spacing: 8) {
                // This is the name label that describes the weather information.
                Text(name)
                    .font(.caption)
                
                // This is the value label that displays the actual weather information.
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

// This struct provides a preview of `WeatherRow` with hardcoded values.
struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
