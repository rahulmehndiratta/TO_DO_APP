//
//  TaskListDataSource.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//
import RealmSwift

protocol TaskListDataSource: AnyObject {
    var taskList: [TaskModel] { get }
    var realmListresult: Results<TaskModel> { get }
    var realmNotification: NotificationToken? { get set }
    var taskListSort: SortingOptions { get set }
    var taskListFilterOption: FilterOptions { get set }
}
