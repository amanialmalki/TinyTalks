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
        .init(Image: "I", Label: "I", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A person and hand up represent I"),
        .init(Image: "Want", Label: "Want", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A lightbulb to represent an idea or a want"),
        .init(Image: "No", Label: "No", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A thumbs down hand to represent disapproval"),
        .init(Image: "Yes", Label: "Yes", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A thumbs up hand to represent approval"),
        .init(Image: "Listen", Label: "Listen", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "An ear to represent listening"),
        .init(Image: "Need", Label: "Need", status: .CommonUsed, constantProperty: "CommonUsedConstant", imageLabel: "A raised hand to represent a need")
    ]
    
    static var activity: [CardContent] = [
        .init(Image: "Walk", Label: "Walk", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person walking"),
        .init(Image: "Dance", Label: "Dance", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person dancing"),
        .init(Image: "Play", Label: "Play", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person playing"),
        .init(Image: "Draw", Label: "Draw", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A hand drawing"),
        .init(Image: "Basketball", Label: "Basketball", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person playing basketball"),
        .init(Image: "Hiking", Label: "Hiking", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person hiking"),
        /*.init(Image: "Jumprope", Label: "Jumprope", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person jumping rope")*/
        .init(Image: "Swim", Label: "Swim", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person swimming"),
        .init(Image: "Yoga", Label: "Yoga", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person doing yoga"),
        .init(Image: "Cycling", Label: "Cycling", status: .Activity, constantProperty: "ActivityConstant", imageLabel: "A person cycling")
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
    static var ConjunctionWords: [CardContent] = [
        .init(Image: " ", Label: "or", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel: "or word"),
        .init(Image: " ", Label: "but", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"but word"),
        .init(Image: " ", Label: "and", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel: "and word"),
        .init(Image: " ", Label: "yet", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"yet word"),
        .init(Image: " ", Label: "if", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"if word"),
        .init(Image: " ", Label: "although", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"although word"),
        .init(Image: " ", Label: "though", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"though word"),
        .init(Image: " ", Label: "unless", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"unless word"),
        .init(Image: " ", Label: "after", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"after word"),
        .init(Image: " ", Label: "before", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"before word"),
        .init(Image: " ", Label: "until", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"until word"),
        .init(Image: " ", Label: "once", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"Once word"),
        .init(Image: " ", Label: "whenever", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"whenever word"),
        .init(Image: " ", Label: "while", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"while word"),
        .init(Image: " ", Label: "in case", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"in case word"),
        .init(Image: " ", Label: "as", status: .ConjunctionWords, constantProperty: "ConjunctionWordsConstant", imageLabel:"as word")

    ]
}
