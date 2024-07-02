//
//  BuildingMaterial.swift
//  ConstructionFactorySimulator
//
//  Created by Clark Adams on 7/2/24.
//

import Foundation

class BuildingMaterial: Material {
    var id: UUID
    var name: String
    var amount: Int
    
    init(name: String, amount: Int) {
        self.id = UUID()
        self.name = name
        self.amount = amount
        print("Material object \(name) was created.")
    }
    
    deinit {
        print("Material object \(name) was destroyed.")
    }
    
    static func == (lhs: BuildingMaterial, rhs: BuildingMaterial) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
