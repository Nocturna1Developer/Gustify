/*
--------------------------------------------------------------------------------------
Summary:
This script defines a `LocationManager` class which is responsible for managing location updates
using the `CLLocationManager` class provided by the Core Location framework.

The class is designed to be used with SwiftUI and leverages its `ObservableObject` protocol and
`@Published` property wrapper to publish changes to its `location` and `isLoading` properties.

The `location` property holds the most recently received location coordinate, and `isLoading`
indicates whether the location is currently being updated.

`LocationManager` also serves as the delegate for `CLLocationManager`, handling location updates
and errors by implementing the relevant `CLLocationManagerDelegate` methods.

--------------------------------------------------------------------------------------
*/

import Foundation
import CoreLocation

class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // A CLLocationManager object is used to configure, start, and stop the delivery of location-related events to your app.
    let manager = CLLocationManager()
    
    // The location property holds the most recently received location coordinate.
    @Published var location: CLLocationCoordinate2D?
    
    // The isLoading property is used to indicate whether the location is currently being updated.
    @Published var isLoading = false
    
    // The LocationManager is initialized and sets itself as the delegate for the CLLocationManager.
    override init() {
        super.init()
        manager.delegate = self
    }
    
    // This method is called to request the current location.
    func requestLocation()
    {
        isLoading = true
        manager.requestLocation()
    }
    
    // CLLocationManagerDelegate method called when new locations are available.
    // The first location in the array is taken and saved in the location property.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations.first?.coordinate
        isLoading = false
    }
    
    // CLLocationManagerDelegate method called when an error occurred while trying to get the location.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
    }
}
