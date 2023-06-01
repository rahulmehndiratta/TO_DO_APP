//
//  TaskListViewSpy.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class TaskListViewSpy: TaskListPresenterToViewProtocol {
    func reloadTableView() {
        debugPrint("reloadTableView")
    }
    
    func showSortPopUp() {
        debugPrint("showSortPopUp")
    }
    
    func showFilterPopUp() {
        debugPrint("showFilterPopUp")
    }
    
    func configureUiView() {
        debugPrint("Config Main view")
    }
}

