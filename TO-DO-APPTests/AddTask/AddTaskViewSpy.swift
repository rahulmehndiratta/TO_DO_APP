//
//  AddTaskViewSpy.swift
//  TO-DO-APPTests
//
//  Created by Rahul on 01/06/23.
//

@testable import TO_DO_APP
import XCTest

final class AddTaskViewSpy: AddTaskPresenterToViewProtocol {
    func configureUiView() {
        debugPrint("Config Main view")
    }
    
    func showDatePicker() {
        debugPrint("Show Date Picker")
    }
    
    func showAlertMessage(message: String) {
        debugPrint("Show Alert message")
    }
    
    func resetView() {
        debugPrint("Reset View")
    }
    
    func updateDateOnView(strTime: String, strPeriodTime: String) {
        debugPrint("updateDateOnView")
    }    
}
