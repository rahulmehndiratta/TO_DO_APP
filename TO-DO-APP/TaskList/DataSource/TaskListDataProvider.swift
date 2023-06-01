//
//  TaskListDataProvider.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//
import RealmSwift

final class TaskListDataProvider {
    private var taskArray = [TaskModel]()
    let realm = try! Realm()
    let results = try! Realm().objects(TaskModel.self).sorted(byKeyPath: "createdAt")
    var notificationToken: NotificationToken?
    var listSort = SortingOptions.old
    var listFilter = FilterOptions.all
}

extension TaskListDataProvider: TaskListDataSource {
    var taskList: [TaskModel] {
        get {
            var tempListArray = DatabaseHelper.shared.getAllTask()
            switch listFilter {
            case .completed:
                tempListArray = tempListArray.filter {$0.status == 2}
            case .pending:
                tempListArray = tempListArray.filter { $0.status == 1 }
            case .todo:
                tempListArray = tempListArray.filter { $0.status == 0 }
            default:
                tempListArray = DatabaseHelper.shared.getAllTask()
            }
            
            switch listSort {
            case .new:
                tempListArray = tempListArray.sorted(by: { $0.createdAt > $1.createdAt})
            case .old:
                tempListArray = tempListArray.sorted(by: { $0.createdAt < $1.createdAt})
            case .aToZ:
                tempListArray = tempListArray.sorted(by: { $0.title < $1.title})
            default:
                tempListArray = tempListArray.sorted(by: { $0.title > $1.title})
            }
            return tempListArray
        }
    }
    
    var taskListSort: SortingOptions {
        get {
            listSort
        }
        set {
            listSort = newValue
        }
    }
    
    var taskListFilterOption: FilterOptions {
        get {
            listFilter
        }
        set {
            listFilter = newValue
        }
    }
    
    var realmNotification: NotificationToken? {
        get {
            return notificationToken
        }
        set {
            notificationToken = newValue
        }
    }
    
    var realmListresult: Results<TaskModel> {
        return results
    }
}
