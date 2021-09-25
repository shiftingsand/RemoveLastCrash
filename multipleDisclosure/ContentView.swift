//
//  ContentView.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 9/24/21.
//

import SwiftUI

struct Animals : Identifiable {
    let id = UUID()
    var name : String
    var weight : Int
}

struct Country : Identifiable {
    let id = UUID()
    var name : String
    var animals : [Animals]
}

struct ContentView: View {
    @State private var myList : [Country] = [Country(name: "USA", animals: [Animals(name: "Turtle", weight: 15), Animals(name: "Cat", weight: 8)]), Country(name: "Canada", animals: [Animals(name: "Moose", weight: 990), Animals(name: "Beaver", weight: 20)]), Country(name: "Germany", animals: [Animals(name: "Chamois", weight: 130), Animals(name: "European Badger", weight: 37)])]
    @State private var expandMe = true
    var body: some View {
        List {
            ForEach(myList) { oneCountry in
                DisclosureGroup(isExpanded: $expandMe) {
                    ForEach(oneCountry.animals) { oneAnimal in
                        Text("\(oneAnimal.name) \(oneAnimal.weight) pounds")
                    }
                } label: {
                    Text("\(oneCountry.name)")
                        .font(.headline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
