//
//  ConstructionFactory.swift
//  ConstructionFactorySimulator
//
//  Created by Clark Adams on 7/2/24.
//

import Foundation

class ConstructionFactory: Factory {
    var name: String
    var workers: Set<Person>
    var materials: Set<BuildingMaterial>
    
    // MARK: - Initializers
    init(name: String, workers: Set<Person>, materials: Set<BuildingMaterial>) {
        self.name = name
        self.workers = workers
        self.materials = materials
        print("Factory \(name) was created.")
    }
    
    convenience init(name: String, workers: Set<Person>) {
        self.init(name: name, workers: workers, materials: [])
    }
    
    convenience init(name: String, materials: Set<BuildingMaterial>) {
        self.init(name: name, workers: [], materials: materials)
    }
    
    convenience init(name: String) {
        self.init(name: name, workers: [], materials: [])
    }
    
    // MARK: - Worker Management
    func hire(worker: Person) {
        if workers.contains(worker) {
            print("Worker \(worker.fullName) already works at the factory.")
        } else {
            workers.insert(worker)
            print("Hired worker \(worker.fullName).")
        }
    }
    
    func fire(worker: Person) {
        if workers.contains(worker) {
            workers.remove(worker)
            print("Fired worker \(worker.fullName).")
        } else {
            print("Worker \(worker.fullName) does not work at the factory.")
        }
    }
    
    func findWorker(byName name: String) -> Person? {
        return workers.first { $0.fullName == name }
    }
    
    func listWorkers() {
        print("Workers in factory \(name):")
        for worker in workers {
            print("- \(worker.fullName)")
        }
    }
    
    // MARK: - Material Management
    func addMaterial(material: BuildingMaterial) {
        if materials.contains(material) {
            print("Material \(material.name) already exists in the factory.")
        } else {
            materials.insert(material)
            print("Added material \(material.name).")
        }
    }
    
    func removeMaterial(material: BuildingMaterial) {
        if materials.contains(material) {
            materials.remove(material)
            print("Removed material \(material.name).")
        } else {
            print("Material \(material.name) does not exist in the factory.")
        }
    }
    
    func findMaterial(byName name: String) -> BuildingMaterial? {
        return materials.first { $0.name == name }
    }
    
    func filterMaterials(byAmount amount: Int) -> [BuildingMaterial] {
        return materials.filter { $0.amount >= amount }
    }
    
    func listMaterials() {
        print("Materials in factory \(name):")
        for material in materials {
            print("- \(material.name): \(material.amount)")
        }
    }
    
    // MARK: - Deinitializer
    deinit {
        print("Factory \(name) was destroyed.")
    }
}
