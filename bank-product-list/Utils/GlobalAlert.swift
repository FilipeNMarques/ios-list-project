//
//  GlobalAlert.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

final class GlobalAlert {
    static func showDefault(
        on viewController: UIViewController,
        title: String,
        message: String,
        actionTitle: String = "OK"
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)

        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
