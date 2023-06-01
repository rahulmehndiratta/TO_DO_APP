//
//  AddTaskInteractor.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//


final class AddTaskInteractor {
    weak var presenter: AddTaskInteractorToPresenterProtocol?
    
    init(presenter: AddTaskInteractorToPresenterProtocol? = nil) {
        self.presenter = presenter
    }
}

extension AddTaskInteractor: AddTaskPresenterToInteractorProtocol {
    func addNewTaskStatus(item: TaskModel) {
        DatabaseHelper.shared.saveTask(task: item)
    }
}

