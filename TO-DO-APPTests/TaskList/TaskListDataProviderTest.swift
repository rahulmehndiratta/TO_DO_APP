//
//  TaskListDataProviderTest.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class TaskListDataProviderTest: XCTestCase {
    
    var dataSource: TaskListDataSource?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        dataSource = TaskListDataProvider()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        dataSource = nil
    }
    
    func testDataSource() {
        dataSource?.taskListSort = .new
        dataSource?.taskListFilterOption = .completed
        XCTAssertNotNil(dataSource?.realmListresult, "ListResult should not be nil")
        XCTAssertNil(dataSource?.realmNotification, "Notification should not be nil")
        XCTAssertNotNil(dataSource?.taskListFilterOption, "Filter option should not be nil")
        XCTAssertNotNil(dataSource?.taskListSort, "Sort option should not be nil")
        XCTAssertNotNil(dataSource?.taskList, "List should not be nil")
    }
}
