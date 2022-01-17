//
//  ContentView.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 9/24/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var myList : [Country]
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
                    print("hello")
                } label: {
                    Label("delet", systemImage: "trash")
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
