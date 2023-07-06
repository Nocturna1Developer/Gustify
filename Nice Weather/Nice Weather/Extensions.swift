/*
--------------------------------------------------------------------------------------
Summary:
This script contains an extension of the 'Double' type that provides a utility function 'roundDouble()'.
The function 'roundDouble()' converts the 'Double' to a 'String' representation rounded to zero decimal places.

Extensions in Swift are a powerful way to add functionality to existing types.
In this case, 'roundDouble()' can be used on any 'Double' value in your project once this file is included.

For example, if 'temperature' is a 'Double', you can write 'temperature.roundDouble()' to get the
rounded 'String' representation.

--------------------------------------------------------------------------------------
*/

import Foundation

// This extension adds a utility function 'roundDouble()' to the 'Double' type.
extension Double {
    // The 'roundDouble()' function converts the 'Double' to a 'String' representation with no decimal places.
    // The rounding is achieved through the 'String(format:)' initializer, which uses a format string similar to
    // printf-style formatting in C. The "%.0f" format string rounds the 'Double' to zero decimal places.
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
