//
//  CoreDataViewModel.swift
//  Nano 2
//
//  Created by Nyoman Adiwinanda on 25/05/23.
//

import SwiftUI
import CoreData

struct Player {
    let correct: Int16
    let name: String
}

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [PlayerEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "Leaderboard")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA: \(error)")
            }
        }
        fetchLeaderboard()
    }
    
    func fetchLeaderboard() {
        let request = NSFetchRequest<PlayerEntity>(entityName: "PlayerEntity")
        let sort = NSSortDescriptor(key: #keyPath(PlayerEntity.correct), ascending: false)
        request.sortDescriptors = [sort]
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error)")
        }
    }
    
    func addLeaderboard(player: Player) {
        let newLeaderboard = PlayerEntity(context: container.viewContext)
        newLeaderboard.correct = player.correct
        newLeaderboard.name = player.name
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchLeaderboard()
        } catch let error {
            print("Error saving: \(error)")
        }
    }
}
