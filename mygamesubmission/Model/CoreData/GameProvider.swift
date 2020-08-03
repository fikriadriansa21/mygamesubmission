//
//  GameProvider.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 27/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Foundation
import CoreData

class GameProvider{
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GameModel")
        container.loadPersistentStores(completionHandler: {(data, error) in
            if let error = error as NSError?{
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveData(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch  {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
