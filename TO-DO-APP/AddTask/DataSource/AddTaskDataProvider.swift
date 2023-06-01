//
//  AddTaskDataProvider.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//

import Foundation

final class AddTaskDataProvider {
    private var taskDate = Date()
}

extension AddTaskDataProvider: AddTaskDataSource {
    var selectedTaskDate: Date {
        get {
            taskDate
        }
        set {
            taskDate = newValue
        }
    }
    
}

