//
//  TaskListViewToPresenterProtocol.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

protocol TaskListViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func updateTaskStatus(item: TaskModel)
    func removeItemFromList(item: TaskModel)
    func handleAddTaskAction()
    func handleSortAction()
    func handleFilterAction()
    func handleSortOperation(index: Int)
    func handleFilterOperation(index: Int)
    func handleRefreshAction()
}
