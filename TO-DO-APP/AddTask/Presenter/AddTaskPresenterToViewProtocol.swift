//
//  AddTaskPresenterToViewProtocol.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//

protocol AddTaskPresenterToViewProtocol: AnyObject {
    func configureUiView()
    func showDatePicker()
    func showAlertMessage(message: String)
    func resetView()
    func updateDateOnView(strTime: String, strPeriodTime: String)
}
