//
//  TaskListPresenterToInteractorProtocol.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

protocol TaskListPresenterToInteractorProtocol: AnyObject {
    func updateTaskStatus(item: TaskModel)
    func removeItemFromList(item: TaskModel)
    func updateTodoTaskInList()
}
