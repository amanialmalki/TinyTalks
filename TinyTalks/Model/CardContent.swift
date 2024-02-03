//
//  CardContent.swift
//  TinyTalks
//
//  Created by Amani Almalki on 05/06/1445 AH.
//

import SwiftUI

struct CardContent: Identifiable, Hashable {
    var id: UUID = .init()
    var Image: String
    var Label: String
    var status: Status
    let constantProperty: String  // Add a constant property
    var imageLabel: String

    // Initializer to set the constant property
    init(Image: String, Label: String, status: Status, constantProperty: String , imageLabel: String) {
        self.Image = Image
        self.Label = Label
        self.status = status
        self.constantProperty = constantProperty
        self.imageLabel = imageLabel
    }
}
enum Status {
    case CommonUsed
    case Activity
    case Food
    case NewList
    case ConjunctionWords
}

