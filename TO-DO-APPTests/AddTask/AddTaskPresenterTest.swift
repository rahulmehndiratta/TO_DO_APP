//
//  AddTaskPresenterTest.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class AddTaskPresenterTest: XCTestCase {
    
    var dataSource: AddTaskDataSource?
    var interactor: AddTaskInteractor?
    var presenter: AddTaskPresenter?
    var view: AddTaskViewSpy?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        /// View
        view = AddTaskViewSpy()
        
        /// Data Source
        dataSource = AddTaskDataProvider()
        
        /// Interactor
        interactor = AddTaskInteractor()
        
        /// Router
        let router = AddTaskRouterSpy()
        
        /// presenter
        presenter = AddTaskPresenter(view: view!,
                                     interactor: interactor!,
                                     router: router,
                                     dataProvider: dataSource! as! AddTaskDataProvider)
        
        interactor?.presenter = presenter
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        dataSource = nil
        interactor = nil
        presenter = nil
        view = nil
    }
    
    func testPresenter() {
        presenter?.viewDidLoad()
        dataSource?.selectedTaskDate = Date()
        presenter?.handleCancelAction()
        presenter?.handleAddClick(title: "", strTime: "", strTimePeriod: "")
        presenter?.handleAddClick(title: "Test", strTime: "", strTimePeriod: "")
        presenter?.handleAddClick(title: "Test", strTime: "07:00", strTimePeriod: "PM")

        presenter?.handleDonePickerAction(selectedDate: Date())
        presenter?.handleTimePeriodSelection()
    }
}
