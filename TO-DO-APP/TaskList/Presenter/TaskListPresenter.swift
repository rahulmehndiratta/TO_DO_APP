//
//  TaskListPresenter.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

final class TaskListPresenter {
    weak var view: TaskListPresenterToViewProtocol!
    var interactor: TaskListPresenterToInteractorProtocol!
    var router: TaskListPresenterToRouterProtocol!
    var dataSource: TaskListDataSource!
    
    init(view: TaskListPresenterToViewProtocol, interactor: TaskListPresenterToInteractorProtocol, router: TaskListPresenterToRouterProtocol, dataProvider: TaskListDataProvider) {
        self.view = view
        self.interactor = interactor
        self.router = router
        dataSource = dataProvider
    }
}

extension TaskListPresenter: TaskListViewToPresenterProtocol {
    
    func viewDidLoad() {
        view?.configureUiView()
    }
    
    func viewWillAppear() {
        interactor.updateTodoTaskInList()
        view?.reloadTableView()
    }
    
    func updateTaskStatus(item: TaskModel) {
        interactor.updateTaskStatus(item: item)
    }
    
    func removeItemFromList(item: TaskModel) {
        interactor.removeItemFromList(item: item)
    }
    
    func handleAddTaskAction() {
        guard let viewController = view as? TaskListVC else { return }
        router.moveToAddScreen(viewController: viewController)
    }
    
    func handleSortAction() {
        view.showSortPopUp()
    }
    
    func handleFilterAction() {
        view.showFilterPopUp()
    }
    
    func handleSortOperation(index: Int) {
        guard let selectedOption = SortingOptions.allCases[safe: index] else { return }
        dataSource.taskListSort = selectedOption
        view.reloadTableView()
    }
    
    func handleFilterOperation(index: Int) {
        guard let selectedOption = FilterOptions.allCases[safe: index] else { return }
        dataSource.taskListFilterOption = selectedOption
        view.reloadTableView()
    }
    
    func handleRefreshAction() {
        interactor.updateTodoTaskInList()
        view.reloadTableView()
    }
}

extension TaskListPresenter: TaskListInteractorToPresenterProtocol {
    // implementation not required
}
