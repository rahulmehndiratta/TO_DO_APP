//
//  TaskListConstant.swift
//  TO-DO-APP
//
//  Created by Rahul on 01/06/23.
//

enum SortingOptions: String, CaseIterable {
    case new = "Newest First"
    case old = "Oldest First"
    case aToZ = "A to Z By Title"
    case zToA = "Z to A By Title"
    case cancel = "Cancel"
}

enum FilterOptions: String, CaseIterable {
    case pending = "Pending"
    case todo = "To Do"
    case completed = "Completed"
    case all = "All"
}
