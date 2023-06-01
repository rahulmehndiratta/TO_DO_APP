//
//  TaskList.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

import Foundation
import RealmSwift

class TaskModel: Object {
    @Persisted var title: String = ""
    @Persisted var time: String = ""
    @Persisted var createdAt: Date
    @Persisted var status: Int = 0 /// 0 todo, 1 pending, 2 completed
    
    convenience init(title: String, time: String, createdAt: Date, status: Int = 0){
        self.init()
        self.title = title
        self.time = time
        self.createdAt = createdAt
        self.status = status
    }
}
