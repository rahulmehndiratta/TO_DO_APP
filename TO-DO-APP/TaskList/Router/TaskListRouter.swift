//
//  TaskListRouter.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

import UIKit

final class TaskListRouter: TaskListPresenterToRouterProtocol {
    
    func moveToAddScreen(viewController: UIViewController) {
        let addTaskModule = AddTaskModule()
        guard let addTaskController = addTaskModule.build() else { return }
        viewController.navigationController?.pushViewController(addTaskController, animated: true)
    }
}
