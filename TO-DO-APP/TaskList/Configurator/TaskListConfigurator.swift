//
//  TaskListConfigurator.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

import Foundation
import UIKit

final class TaskListModule {
    
    func build() -> UIViewController? {
        let view = Storyboard.list.instantiateVC(TaskListVC.self)
        let viewController = view
        
        let interactor = TaskListInteractor()
        let router = TaskListRouter()
        let dataProvider = TaskListDataProvider()
        let presenter = TaskListPresenter(view: view,
                                          interactor: interactor,
                                          router: router,
                                          dataProvider: dataProvider)
        
        interactor.presenter = presenter
        view.presenter = presenter
        view.dataSource = dataProvider
        return viewController
    }
}
