//
//  DatabaseHelper.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

import RealmSwift
import UIKit

class DatabaseHelper{
    
    static let shared = DatabaseHelper()
    /// Open the local-only default realm
    private var realm = try! Realm()
    
    func getDatabasePath() -> URL?{
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func saveTask(task: TaskModel){
        do {
            let realm = try Realm()
            realm.beginWrite()
            try realm.safeWrite {
                realm.add(task)
            }
           try realm.commitWrite()
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
    
    func updateTodoTaskNotMarkPending() {
        do {
            let realm = try Realm()
            // Get the current date and time
            let currentDate = Date()

            // Create a predicate for the query
            let predicate = NSPredicate(format: "status == 0 AND createdAt < %@", currentDate as NSDate)
            
            let list = realm.objects(TaskModel.self).filter(predicate)
            for item in list {
                updateTaskStatus(item: item, withStatus: 1)
            }
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
    
    func updateTaskStatus(item: TaskModel, withStatus: Int = 2) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            try realm.safeWrite {
                item.status = withStatus
            }
           try realm.commitWrite()
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
    
    func deleteTask(task: TaskModel){
        do {
            let realm = try Realm()
            realm.beginWrite()
            try realm.safeWrite {
                realm.delete(task)
            }
           try realm.commitWrite()
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
    }
    
    func getAllTask() -> [TaskModel]{
        return Array(realm.objects(TaskModel.self))
    }
    
}

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
