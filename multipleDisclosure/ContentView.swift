//
//  ContentView.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 9/24/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var allData : AllData
    @Environment(\.dismiss) private var dismiss
    
    @Binding var myList : [Country]
    let theThing : UUID
    
    var body: some View {
        List {
            ForEach($myList) { $oneCountry in
                DisclosureGroup(isExpanded: $oneCountry.expandMe) {
                    ForEach(oneCountry.animals) { oneAnimal in
                        Text("\(oneAnimal.name) \(oneAnimal.weight) pounds")
                    }
                } label: {
                    Text("\(oneCountry.name)")
                        .font(.headline)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    allData.deleteThingByID(theUUID: theThing)
                } label: {
                    Label("Delete Thing", systemImage: "trash")
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
