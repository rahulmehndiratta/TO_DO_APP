//
//  TaskListPresenterTest.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class TaskListPresenterTest: XCTestCase {
    
    var dataSource: TaskListDataSource?
    var interactor: TaskListInteractor?
    var presenter: TaskListPresenter?
    var view: TaskListViewSpy?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        /// View
        view = TaskListViewSpy()
        
        /// Data Source
        dataSource = TaskListDataProvider()
        
        /// Interactor
        interactor = TaskListInteractor()
        
        /// Router
        let router = TaskListRouterSpy()
        
        /// presenter
        presenter = TaskListPresenter(view: view!,
                                      interactor: interactor!,
                                      router: router,
                                      dataProvider: dataSource! as! TaskListDataProvider)
        
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
        let item = TaskModel(title: "test", time: "08:09 PM", createdAt: Date())
        presenter?.viewDidLoad()
        presenter?.viewWillAppear()
        presenter?.handleAddTaskAction()
        presenter?.handleSortAction()
        presenter?.handleFilterAction()
        presenter?.handleSortOperation(index: 0)
        presenter?.handleFilterOperation(index: 0)
        presenter?.handleRefreshAction()
        presenter?.updateTaskStatus(item: item)
    }
}

