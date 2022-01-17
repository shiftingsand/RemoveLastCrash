//
//  multipleDisclosureApp.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 9/24/21.
//

import SwiftUI

@main
struct multipleDisclosureApp: App {
    @StateObject var allData = AllData()
    var body: some Scene {
        WindowGroup {
            Landing()
                .environmentObject(allData)
        }
    }
}
