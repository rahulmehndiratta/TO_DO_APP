//
//  TaskListPresenterToViewProtocol.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

protocol TaskListPresenterToViewProtocol: AnyObject {
    func configureUiView()
    func reloadTableView()
    func showSortPopUp()
    func showFilterPopUp()
}
