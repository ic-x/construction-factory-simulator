//
//  Passport.swift
//  ConstructionFactorySimulator
//
//  Created by Clark Adams on 7/2/24.
//

import Foundation

class Passport: Codable {
    var series: String
    var number: String
    var dateOfIssue: Date
    weak var owner: Person?
    
    init(series: String, number: String, dateOfIssue: Date, owner: Person?) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        self.owner = owner
        print("Passport object \(series) \(number) was created.")
    }
    
    deinit {
        print("Passport object \(series) \(number) was destroyed.")
    }
}
