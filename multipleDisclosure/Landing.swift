//
//  Landing.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 9/24/21.
//

import SwiftUI

struct Landing: View {
    var body: some View {
        NavigationView {
            NavigationLink("See animals", destination: ContentView())
        }
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
