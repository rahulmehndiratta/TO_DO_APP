//
//  TaskListVC.swift
//  TO-DO-APP
//
//  Created by Rahul on 30/05/23.
//

import RealmSwift
import UIKit

final class TaskListVC: UIViewController {
    
    // MARK: Outlet and Variables
    @IBOutlet private weak var emptyMessageLabel: UILabel!
    @IBOutlet private weak var tableViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    var presenter: TaskListViewToPresenterProtocol!
    var dataSource: TaskListDataSource!

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    
}

private extension TaskListVC{
    
    func configuration() {
        // set page title
        self.title = AppStringConstants.listTitle
        // Left button
        let sortingButton = UIBarButtonItem(image: ImageConstant.sorting?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = sortingButton

        // Right button
        let filterButton = UIBarButtonItem(image: ImageConstant.filter?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    // Action methods for the button tap events
    @objc func leftButtonTapped() {
        presenter.handleSortAction()
    }

    @objc func rightButtonTapped() {
        presenter.handleFilterAction()
    }
    
    func addBorderToTableView() {
        let borderWidth: CGFloat = 1.0
        let borderColor = ColorConstants.border?.cgColor
        
        tableView.layer.borderWidth = borderWidth
        tableView.layer.borderColor = borderColor
        tableView.layer.cornerRadius = 10
    }
    
    func adjustTableViewHeight() {
        let contentInset = tableView.contentInset
        tableViewHeightConstraints.constant = tableView.contentSize.height + contentInset.top + contentInset.bottom
        addBorderToTableView()
    }
    
    func checkFormEmptyMessage() {
        tableView.isHidden = dataSource.taskList.isEmpty
        emptyMessageLabel.isHidden = !dataSource.taskList.isEmpty
    }
    
    func handleRealmNotification() {
        // Set results notification block
        dataSource.realmNotification = dataSource.realmListresult.observe { changes in
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
                if !deletions.isEmpty {
                   // self.dataSource.refreshTaskArray
                    self.checkFormEmptyMessage()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.adjustTableViewHeight()
                    }
                }
                if !insertions.isEmpty {
                    return
                }
                self.tableView.beginUpdates()
                
                let validDeletions = deletions.filter { $0 < self.tableView.numberOfRows(inSection: 0) }

                self.tableView.deleteRows(at: validDeletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                
                self.tableView.endUpdates()
            case .error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(err)")
            }
        }
    }
    
    @IBAction func onTapAddTask(_ sender: Any) {
        presenter?.handleAddTaskAction()
    }
    
    @IBAction func onTapRefresh(_ sender: Any) {
        presenter?.handleRefreshAction()
    }
    
}

extension TaskListVC: ItemListCellProtocol {
    func updateItemStatus(item: TaskModel) {
        presenter?.updateTaskStatus(item: item)
    }
    
    func removeItemFromList(item: TaskModel) {
        let buttonTitles = [AppStringConstants.cancel, AppStringConstants.ok]
        showAlert(title: AppStringConstants.warning, message: AppStringConstants.warningMessage, value: "", buttonTitles: buttonTitles) { value, buttonIndex in
            if buttonIndex == 1 {
                self.presenter?.removeItemFromList(item: item)
            }
        }
    }
    
}

extension TaskListVC: TaskListPresenterToViewProtocol {
    func configureUiView() {
        configuration()
        handleRealmNotification()
    }
    
    func reloadTableView() {
        checkFormEmptyMessage()
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.adjustTableViewHeight()
        }
    }
    
    func showSortPopUp() {
        showAlert(title: AppStringConstants.sorting, message: AppStringConstants.sortMessage, value: "", buttonTitles: SortingOptions.allCases.map{ $0.rawValue }) { value, buttonIndex in
            self.presenter.handleSortOperation(index: buttonIndex)
        }
    }
    
    func showFilterPopUp() {
        showAlert(title: AppStringConstants.filter, message: AppStringConstants.filterMessage, value: "", buttonTitles: FilterOptions.allCases.map{ $0.rawValue }) { value, buttonIndex in
            self.presenter.handleFilterOperation(index: buttonIndex)
        }
    }
}

extension TaskListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.taskList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ItemListTVC", owner: self, options: nil)?[0] as! ItemListTVC
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.delegate = self
        let taskData = dataSource.taskList[indexPath.row]
        cell.updateCellWithData(task: taskData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.01
    }
}
