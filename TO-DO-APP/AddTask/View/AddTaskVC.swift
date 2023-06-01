//
//  AddTaskVC.swift
//  TO-DO-APP
//
//  Created by Rahul on 29/05/23.
//

import UIKit

final class AddTaskVC: UIViewController {
    
    // MARK: Outlet and Variables
    @IBOutlet private weak var textFieldTitle: UITextField!
    @IBOutlet private weak var textFieldTime: UITextField!
    @IBOutlet private weak var textFieldTimePeriod: UITextField!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    var presenter: AddTaskViewToPresenterProtocol!
    var dataSource: AddTaskDataSource!
    let datePicker = UIDatePicker()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

private extension AddTaskVC {
    func setupUI() {
        self.title = AppStringConstants.addScreenTitle
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 20
        addButton.layer.cornerRadius = 20
        cancelButton.layer.borderColor = ColorConstants.border?.cgColor
        textFieldTitle.delegate = self
        textFieldTime.delegate = self
        setDatePicker()
    }
    
    @IBAction func onTapAdd(_ sender: Any) {
        presenter.handleAddClick(title: textFieldTitle.text, strTime: textFieldTime.text, strTimePeriod: textFieldTimePeriod.text)
    }
    
    @IBAction func onTapTimePeriodSelection(_ sender: Any) {
        presenter.handleTimePeriodSelection()
    }
    
    @IBAction func onTapCancel(_ sender: Any) {
        presenter.handleCancelAction()
    }
}

extension AddTaskVC {
    func setDatePicker() {
        //Format Date
        datePicker.datePickerMode = .time
        datePicker.minimumDate = Date()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }

        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: AppStringConstants.done, style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: AppStringConstants.cancel, style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)

        textFieldTime.inputAccessoryView = toolbar
        textFieldTime.inputView = datePicker
    }

    @objc func doneDatePicker(){
        presenter.handleDonePickerAction(selectedDate: datePicker.date)
    }

    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}

extension AddTaskVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textFieldTime == textField {
            textFieldTitle.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textFieldTitle == textField {
            return range.location < 50
        }
        return true
    }
}

extension AddTaskVC: AddTaskPresenterToViewProtocol {
    func configureUiView() {
        setupUI()
    }
    
    func showDatePicker() {
        textFieldTitle.resignFirstResponder()
        textFieldTime.becomeFirstResponder()
    }
    
    func showAlertMessage(message: String) {
        showAlert(title: AppStringConstants.warning, message: message, value: "", buttonTitles: [AppStringConstants.ok]) { value, buttonIndex in
            debugPrint(buttonIndex)
        }
    }
    
    func resetView() {
        textFieldTime.text = ""
        textFieldTitle.text = ""
    }
    
    func updateDateOnView(strTime: String, strPeriodTime: String) {
        textFieldTime.text = strTime
        textFieldTimePeriod.text = strPeriodTime
        self.view.endEditing(true)
    }
}
