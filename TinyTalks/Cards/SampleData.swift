//
//  SampleData.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 06/06/1445 AH.
//

import Foundation

struct SampleData {
    ///Sample Tasks
    static var newList: [CardContent] = [
        .init(Image: "", Label: "", status: .NewList, constantProperty: "",imageLabel: "")
    ]
    static var commonUsed: [CardContent] = [
        .init(Image: "figure.wave", Label: "I", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A person and hand up represent I"),
        .init(Image: "lightbulb.min.fill", Label: "Want", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A lightbulb to represent an idea or a want"),
        .init(Image: "hand.thumbsdown.fill", Label: "No", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A thumbs down hand to represent disapproval"),
        .init(Image: "hand.thumbsup.fill", Label: "Yes", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A thumbs up hand to represent approval"),
        .init(Image: "ear.fill", Label: "Listen", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "An ear to represent listening"),
        .init(Image: "hand.raised.app", Label: "Need", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A raised hand to represent a need")
    ]
    
    static var activity: [CardContent] = [
        .init(Image: "figure.walk", Label: "Walk", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person walking"),
        .init(Image: "figure.dance", Label: "Dance", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person dancing"),
        .init(Image: "figure.play", Label: "Play", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person playing"),
        .init(Image: "hand.draw.fill", Label: "Draw", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A hand drawing"),
        .init(Image: "figure.basketball", Label: "Basketball", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person playing basketball"),
        .init(Image: "figure.hiking", Label: "Hiking", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person hiking"),
        .init(Image: "figure.jumprope", Label: "Jumprope", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person jumping rope"),
        .init(Image: "figure.pool.swim", Label: "Swim", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person swimming"),
        .init(Image: "figure.mind.and.body", Label: "Yoga", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person doing yoga"),
        .init(Image: "figure.outdoor.cycle", Label: "Cycling", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person cycling")
    ]
    
    static var food: [CardContent] = [
        .init(Image: "Apple", Label: "apple", status: .Food, constantProperty: "FoodConstant", imageLabel: "Apple"),
        .init(Image: "banana", Label: "Banana", status: .Food, constantProperty: "FoodConstant", imageLabel:"Banana"),
        .init(Image: "Chocolate", Label: "Chocolate", status: .Food, constantProperty: "FoodConstant", imageLabel: "Chocolate"),
        .init(Image: "Cookies", Label: "Cookies", status: .Food, constantProperty: "FoodConstant", imageLabel:"Cookies"),
        .init(Image: "Donut", Label: "Donut", status: .Food, constantProperty: "FoodConstant", imageLabel:"Donut"),
        .init(Image: "Egg", Label: "Egg toast", status: .Food, constantProperty: "FoodConstant", imageLabel:"Egg toast"),
        .init(Image: "icecream", Label: "Ice Cream", status: .Food, constantProperty: "FoodConstant", imageLabel:"Ice Cream")
    ]
}
