//
//  TaskListInteractor.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

final class TaskListInteractor {
    weak var presenter: TaskListInteractorToPresenterProtocol?
    
    init(presenter: TaskListInteractorToPresenterProtocol? = nil) {
        self.presenter = presenter
    }
}

extension TaskListInteractor: TaskListPresenterToInteractorProtocol {
    func updateTaskStatus(item: TaskModel) {
        DatabaseHelper.shared.updateTaskStatus(item: item)
    }
    
    func removeItemFromList(item: TaskModel) {
        DatabaseHelper.shared.deleteTask(task: item)
    }
    
    func updateTodoTaskInList() {
        DatabaseHelper.shared.updateTodoTaskNotMarkPending()
    }
}
