//
//  AddTaskPresenter.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//

import Foundation

final class AddTaskPresenter {
    weak var view: AddTaskPresenterToViewProtocol!
    var interactor: AddTaskPresenterToInteractorProtocol!
    var router: AddTaskPresenterToRouterProtocol!
    var dataSource: AddTaskDataSource!
    
    init(view: AddTaskPresenterToViewProtocol, interactor: AddTaskPresenterToInteractorProtocol, router: AddTaskPresenterToRouterProtocol, dataProvider: AddTaskDataProvider) {
        self.view = view
        self.interactor = interactor
        self.router = router
        dataSource = dataProvider
    }
}

extension AddTaskPresenter: AddTaskViewToPresenterProtocol {
    
    func viewDidLoad() {
        view.configureUiView()
    }
    
    func handleCancelAction() {
        guard let viewController = view as? AddTaskVC else { return }
        router.backToListScreen(viewController: viewController)
    }
    
    func handleTimePeriodSelection() {
        view.showDatePicker()
    }
    
    func handleAddClick(title: String?, strTime: String?, strTimePeriod: String?) {
        if title?.isEmpty ?? false {
            view.showAlertMessage(message: "Please enter tittle.")
        } else if strTime?.isEmpty ?? false {
            view.showAlertMessage(message: "Please select time.")
        } else {
            let strTime = "\(strTime ?? "") \(strTimePeriod ?? "")"
            let task = TaskModel.init(title: title ?? "", time: strTime, createdAt: dataSource.selectedTaskDate)
            interactor.addNewTaskStatus(item: task)
            view.showAlertMessage(message: "Task saved in database.")
            view.resetView()
        }
    }

    func handleDonePickerAction(selectedDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let strTime = formatter.string(from: selectedDate)
        view.updateDateOnView(strTime: strTime.components(separatedBy: " ").first ?? "", strPeriodTime: strTime.components(separatedBy: " ").last ?? "")
        dataSource.selectedTaskDate = selectedDate
    }
}

extension AddTaskPresenter: AddTaskInteractorToPresenterProtocol {
    // implementation not required
}
