//
//  AllData.swift
//  multipleDisclosure
//
//  Created by Chris Wu on 1/17/22.
//

import Foundation

struct Animals : Identifiable {
    let id = UUID()
    var name : String
    var weight : Int
}

struct Country : Identifiable {
    let id = UUID()
    var name : String
    var animals : [Animals]
    var expandMe = true
}

struct Things : Identifiable {
    let id = UUID()
    let name : String
    var theList : [Country]
}

final class AllData : ObservableObject {
    @Published var mainList = [Things]()
    
    init() {
      mainList = [Things(name: "one", theList:  junk), Things(name: "two", theList: junk2), Things(name: "three", theList: junk3)]
    }
    
    func deleteThingByID(theUUID : UUID) {
        if let foundThingIndex = mainList.firstIndex(where: { oneThing in
            oneThing.id == theUUID
        }) {
            mainList.remove(at: foundThingIndex)
            objectWillChange.send()
            print("deleted thing at index \(foundThingIndex)")
        } else {
            print("delete thing error ☠️")
        }
    }
    
    func addJunkData() {
        let theFormatter = DateFormatter()
        theFormatter.dateFormat = "MM-dd-y H:mm:ss"
        let stringVal = theFormatter.string(from: Date())
        let tmpThing = Things(name: stringVal, theList: junk)
        
        mainList.append(tmpThing)
        objectWillChange.send()
        print("appended thing")
    }
}

let junk : [Country] = [Country(name: "USA", animals: [Animals(name: "Turtle", weight: 15), Animals(name: "Cat", weight: 8)]), Country(name: "Canada", animals: [Animals(name: "Moose", weight: 990), Animals(name: "Beaver", weight: 20)]), Country(name: "Germany", animals: [Animals(name: "Chamois", weight: 130), Animals(name: "European Badger", weight: 37)])]
let junk2 : [Country] = [Country(name: "USA2", animals: [Animals(name: "Turtle", weight: 15), Animals(name: "Cat", weight: 8)]), Country(name: "Canada2", animals: [Animals(name: "Moose", weight: 990), Animals(name: "Beaver", weight: 20)]), Country(name: "Germany2", animals: [Animals(name: "Chamois", weight: 130), Animals(name: "European Badger", weight: 37)])]
let junk3 : [Country] = [Country(name: "USA3", animals: [Animals(name: "Turtle", weight: 15), Animals(name: "Cat", weight: 8)]), Country(name: "Canada3", animals: [Animals(name: "Moose", weight: 990), Animals(name: "Beaver", weight: 20)]), Country(name: "Germany3", animals: [Animals(name: "Chamois", weight: 130), Animals(name: "European Badger", weight: 37)])]
