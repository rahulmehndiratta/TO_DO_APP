//
//  AddTaskConfigurator.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//

import Foundation
import UIKit

final class AddTaskModule {
    
    func build() -> UIViewController? {
        let view = Storyboard.add.instantiateVC(AddTaskVC.self)
        
        let viewController = view
        
        let interactor = AddTaskInteractor()
        let router = AddTaskRouter()
        let dataProvider = AddTaskDataProvider()
        let presenter = AddTaskPresenter(view: view,
                                         interactor: interactor,
                                         router: router,
                                         dataProvider: dataProvider)
        
        interactor.presenter = presenter
        view.presenter = presenter
        view.dataSource = dataProvider
        return viewController
    }
}
