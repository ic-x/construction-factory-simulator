//
//  Person.swift
//  ConstructionFactorySimulator
//
//  Created by Clark Adams on 7/2/24.
//

import Foundation

class Person: Hashable, Codable {
    var id: UUID
    var fullName: String
    var age: Int
    var passport: Passport?
    
    init(fullName: String, age: Int, passport: Passport? = nil) {
        self.id = UUID()
        self.fullName = fullName
        self.age = age
        self.passport = passport
        print("Person object \(fullName) was created.")
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    deinit {
        print("Person object \(fullName) was destroyed.")
    }
}
