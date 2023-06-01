//
//  AddTaskRouter.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//

import UIKit

final class AddTaskRouter: AddTaskPresenterToRouterProtocol {
    
    func backToListScreen(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: false)
    }
}
