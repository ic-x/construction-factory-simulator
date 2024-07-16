//
//  Protocols.swift
//  ConstructionFactorySimulator
//
//  Created by Clark Adams on 7/2/24.
//

import Foundation

protocol Material: Hashable {
    var name: String { get set }
    var amount: Int { get set }
    
    func description() -> String
}

extension Material {
    func description() -> String {
        return "Material: \(name), Amount: \(amount)"
    }
}

protocol Factory {
    associatedtype T: Material
    var name: String { get }
    var workers: Set<Person> { get set }
    var materials: Set<T> { get set }
    
    mutating func hire(worker: Person)
    mutating func fire(worker: Person)
    mutating func addMaterial(material: T)
    mutating func removeMaterial(material: T)
    func description() -> String
}

extension Factory {
    func description() -> String {
        return "Factory: \(name), Workers: \(workers.count), Materials: \(materials.count)"
    }
}
