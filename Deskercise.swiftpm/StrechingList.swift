//
//  StrechingList.swift
//  Deskercise 2
//
//  Created by Satria Perdana on 08/04/23.
//


// Disclamer for the data
/* This data I got from : https://www.bupa.co.uk/newsroom/ourviews/desk-stretches?_its=JTdCJTIydmlkJTIyJTNBJTIyOGFhYWJkNTQtYTVjYi00ZmQ3LWE2NTYtOTIzYjFkMTY1OGUzJTIyJTJDJTIyc3RhdGUlMjIlM0ElMjJybHR%2BMTY4MDc4NzAyMX5sYW5kfjJfNjk1OTNfc2VvXzg0ODM0MDMzNzc2YjRlZDFiOGQ5MWE4ZDEyYzg4NTJiJTIyJTJDJTIyc2l0ZUlkJTIyJTNBODY4MSU3RA%3D%3D
 
    And point 4 I got from this webiste
    http://www.atensionseeker.ie/back-extensions-and-mobilisations.html
    point number 18
 */

// I Used the my own illustration but with the referance from that website

// Credit
//
// I created this Model from Paul Hudson's video. It little bit hard to understand how this model works since I never really doing a programming think. But he help me a lot when I'm create this code!

import Foundation

struct Item: Identifiable, Hashable {
    var id = UUID()
    var number: Int
    var image: String
    var title: String
    var descriptions: [String]
    
    init(id: UUID = UUID(), number: Int, image: String, title: String, descriptions: [String]) {
        self.id = id
        self.number = number
        self.image = image
        self.title = title
        self.descriptions = descriptions
    }
    
    
    //MARK: It's for debugging and testing
    static let example = Item(
        number: 1,
        image: "image-1",
        title: "Seated Spnial Rotation".capitalized,
        descriptions: ["While seated, cross your arms over your chest", "Grab your shoulders", "Rotate your upper body from the waist, turning gently from left to right as far as feels comfortable", "You should feel a tension on both side of your lower back as it stretches out."])
    
    var numberedDescriptions: [String] {
        return descriptions.enumerated().map{"\($0.offset + 1). \($0.element)"}
    }
}

let items = [
    
    Item(
        number: 1,
        image: "image-1",
        title: "Seated Spnial Rotation".capitalized,
        descriptions: ["While seated, cross your arms over your chest", "Grab your shoulders", "Rotate your upper body from the waist, turning gently from left to right as far as feels comfortable", "You should feel a tension on both side of your lower back as it stretches out."]),
    
    Item(
        number: 2,
        image: "image-2",
        title: "Posterior shoulder stretch".capitalized,
        descriptions: ["Hold one arm across your body", "Pull your elbow into your chest", "You should feel your shoulder gently stretching"]),
    
    Item(
        number: 3,
        image: "image-3",
        title: "Shoulder shrugs".capitalized,
        descriptions: ["Gently lift your shoulders", "Let them slowly fall.", "You should feel tension being released as your shoulders drop"]),
    
    Item(
        number: 4,
        image: "image-4",
        title: "Thoracic extension".capitalized,
        descriptions: ["Sit all the way back in a chair so that your back is leaning on the backrest.", "Cross your hands on your chest","Extend the thoracic spine over the chair and then come back to the starting position.", "Sets 3, Reps 5, Frequency every day, Duration 5 – 15 sec, Rest 1-2 min"]),
    
    Item(
        number: 5,
        image: "image-5",
        title: "Neck rotations".capitalized,
        descriptions: ["Keep your head upright", "As you turn your head, try to move it past your shoulder", "You should feel the muscles on the outside of your neck gradually stretching"])
]

