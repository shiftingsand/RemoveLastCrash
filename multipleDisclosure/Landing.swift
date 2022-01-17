//
//  Landing.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 9/24/21.
//

import SwiftUI

struct Landing: View {
    @EnvironmentObject var allData : AllData
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
            .navigationTitle(Text("Things"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        allData.addJunkData()
                    } label: {
                        Label("Add Thing", systemImage: "plus")
                    }
                }
            }
        }
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
