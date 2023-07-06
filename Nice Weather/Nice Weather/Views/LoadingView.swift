/*
--------------------------------------------------------------------------------------
Summary:
This SwiftUI file defines a view called LoadingView. This view displays a full-screen
progress view (loading spinner) with a white color. It can be used anywhere in your
application where you need to show a loading state to the user.

The LoadingView_Previews struct provides a preview of the LoadingView that can be
displayed in Xcode's canvas.

--------------------------------------------------------------------------------------
*/

import SwiftUI

// Defines a new SwiftUI View called LoadingView.
struct LoadingView: View {
    // The body property defines the view's content.
    var body: some View {
        // The ProgressView function is a SwiftUI view that shows a circular loading spinner.
        ProgressView()
            // Modifies the ProgressView's style to be a circular spinner (loading circle) with a white tint.
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            // The frame modifier sets the ProgressView to occupy the maximum width and height available,
            // effectively making it a full-screen progress view.
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// This struct provides a preview of the LoadingView.
// It's primarily used for seeing changes to the view's design in Xcode's canvas without having to run the app.
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        // This is where you call the view you want to preview.
        LoadingView()
    }
}
