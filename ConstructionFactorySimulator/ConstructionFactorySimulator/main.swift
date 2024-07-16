//
//  main.swift
//  ConstructionFactorySimulator
//
//  Created by Clark Adams on 7/2/24.
//

import Foundation

func demonstrateConstructionFactorySimulator() {
    // MARK: - Demonstration of no retain cycle
    let passport = Passport(series: "AB", number: "123456", dateOfIssue: Date(), owner: nil)
    ({
        let person = Person(fullName: "John Doe", age: 30, passport: passport)
        passport.owner = person
        print("Person \(person.fullName) with passport \(passport.series) \(passport.number) initialized.")
    })()
    
    // MARK: - Create sample materials
    let bricks = BuildingMaterial(name: "Bricks", amount: 1000)
    let cement = BuildingMaterial(name: "Cement", amount: 500)
    let wood = BuildingMaterial(name: "Wood", amount: 300)
    
    // MARK: - Create sample workers
    let worker1 = Person(fullName: "Alice Smith", age: 28)
    let worker2 = Person(fullName: "Bob Johnson", age: 34)
    let worker3 = Person(fullName: "Charlie Brown", age: 25)
    
    // MARK: - Initialize the factory
    let constructionFactory = ConstructionFactory(name: "Main Construction Factory")
    
    // MARK: - Add materials to the factory
    constructionFactory.addMaterial(material: bricks)
    constructionFactory.addMaterial(material: cement)
    constructionFactory.addMaterial(material: wood)
    
    // MARK: - List materials in the factory
    constructionFactory.listMaterials()
    
    // MARK: - Hire workers
    constructionFactory.hire(worker: worker1)
    constructionFactory.hire(worker: worker2)
    constructionFactory.hire(worker: worker3)
    
    // MARK: - List workers in the factory
    constructionFactory.listWorkers()
    
    // MARK: - Remove a material
    constructionFactory.removeMaterial(material: wood)
    
    // MARK: - List materials after removal
    constructionFactory.listMaterials()
    
    // MARK: - Fire a worker
    constructionFactory.fire(worker: worker2)
    
    // MARK: - List workers after firing
    constructionFactory.listWorkers()
    
    // MARK: - Find a worker by name
    if let foundWorker = constructionFactory.findWorker(byName: "Alice Smith") {
        print("Found worker: \(foundWorker.fullName)")
    } else {
        print("Worker not found.")
    }
    
    // MARK: - Find a material by name
    if let foundMaterial = constructionFactory.findMaterial(byName: "Cement") {
        print("Found material: \(foundMaterial.name), Amount: \(foundMaterial.amount)")
    } else {
        print("Material not found.")
    }
    
    // MARK: - Filter materials by amount
    let filteredMaterials = constructionFactory.filterMaterials(byAmount: 400)
    print("Materials with amount >= 400:")
    for material in filteredMaterials {
        print("- \(material.name): \(material.amount)")
    }
}

demonstrateConstructionFactorySimulator()

