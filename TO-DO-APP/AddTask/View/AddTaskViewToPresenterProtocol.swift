//
//  AddTaskViewToPresenterProtocol.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//

import Foundation

protocol AddTaskViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
    func handleTimePeriodSelection()
    func handleCancelAction()
    func handleAddClick(title: String?, strTime: String?, strTimePeriod: String?)
    func handleDonePickerAction(selectedDate: Date)
}
