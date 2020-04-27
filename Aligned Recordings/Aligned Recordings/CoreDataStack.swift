//
//  CoreDataStack.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/26/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    // MARK: - Properties
    static let shared = CoreDataStack()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Aligned_Recordings" as String)
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Failed to load persistent stores: \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    // MARK: - Methods
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        context.performAndWait {
            do {
                try context.save()
            } catch {
                NSLog("Unable to save context: \(error)")
                context.reset()
            }
        }
    }
}
