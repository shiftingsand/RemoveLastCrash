//
//  Landing.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 9/24/21.
//

import SwiftUI





struct Landing: View {
    @EnvironmentObject var allData : AllData
    //@State var mainList : [Things] = [Things(name: "one", theList:  junk), Things(name: "two", theList: junk), Things(name: "three", theList: junk)]
   //// @State var myList : [Country] = [Country(name: "USA", animals: [Animals(name: "Turtle", weight: 15), Animals(name: "Cat", weight: 8)]), Country(name: "Canada", animals: [Animals(name: "Moose", weight: 990), Animals(name: "Beaver", weight: 20)]), Country(name: "Germany", animals: [Animals(name: "Chamois", weight: 130), Animals(name: "European Badger", weight: 37)])]
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($allData.mainList) { $oneList in
                    NavigationLink(destination: ContentView(myList: $oneList.theList, theThing: oneList.id)) {
                        Text("\(oneList.name)")
                            .padding()
                    }
                }
            }
            //NavigationLink("See animals", destination: ContentView(myList: $myList))
        }
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
