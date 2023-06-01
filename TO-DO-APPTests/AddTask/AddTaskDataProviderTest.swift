//
//  AddTaskDataProviderTest.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class AddTaskDataProviderTest: XCTestCase {
    
    var dataSource: AddTaskDataSource?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        dataSource = AddTaskDataProvider()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        dataSource = nil
    }
    
    func testDataSource() {
        dataSource?.selectedTaskDate = Date()
        XCTAssertNotNil(dataSource?.selectedTaskDate, "SelectedDate should not be nil")
    }
}
