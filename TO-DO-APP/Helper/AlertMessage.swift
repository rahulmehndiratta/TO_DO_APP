//
//  AlertMessage.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//

import UIKit

func showAlert<T>(title: String, message: String, value: T, buttonTitles: [String], handler: ((T, Int) -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    for (index, title) in buttonTitles.enumerated() {
        let action = UIAlertAction(title: title, style: .default) { _ in
            handler?(value, index)
        }
        alertController.addAction(action)
    }
    
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
        if let viewController = keyWindow.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
