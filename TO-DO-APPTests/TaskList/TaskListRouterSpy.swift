//
//  TaskListRouterSpy.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class TaskListRouterSpy: TaskListPresenterToRouterProtocol {
    
    func moveToAddScreen(viewController: UIViewController) {
        debugPrint("moveToAddScreen")
    }
    
}
