//
//  AddTaskRouterSpy.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class AddTaskRouterSpy: AddTaskPresenterToRouterProtocol {
    
    func backToListScreen(viewController: UIViewController) {
        debugPrint("backToListScreen")
    }
    
}
