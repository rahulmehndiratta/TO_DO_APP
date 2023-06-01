//
//  Constant.swift
//  TO-DO-APP
//
//  Created by Rahul on 01/06/23.
//

import UIKit

struct ColorConstants {
    static let textRed = UIColor(named: "TitleRedColor")
    static let textBlack = UIColor(named: "TitleBlackColor")
    static let border = UIColor(named: "BorderColor")
}

struct ImageConstant {
    static let emptyCheckBox = UIImage.init(named: "emptyCheckbox")
    static let fillCheckBox = UIImage.init(named: "checked")
    static let sorting = UIImage.init(named: "Sorting")
    static let filter = UIImage.init(named: "Filter")
    
}

struct AppStringConstants {
    ///Task List
    static let sorting: String = "Sorting"
    static let sortMessage: String = "Please choose sorting options."
    static let filter: String = "Filter"
    static let filterMessage: String = "Please choose sorting options."
    static let listTitle: String = "Task List"
    static let warning: String = "Warning"
    static let warningMessage: String = "Do you want to delete “Classification”, this action can’t be undone."
    static let cancel: String = "Cancel"
    static let ok: String = "Ok"
    
    /// Add Task
    static let addScreenTitle: String = "Add Task"
    static let done: String = "Done"
}

enum Storyboard: String {
    case list = "TaskList"
    case add = "AddTask"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func instantiateVC<T: UIViewController>(_ objectClass: T.Type) -> T {
        return instance.instantiateViewController(withIdentifier: String.getStringOfClass(objectClass: objectClass)) as! T
    }
}
