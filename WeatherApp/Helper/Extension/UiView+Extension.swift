//
//  UiView+Extension.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 29/09/23.
//

import UIKit

extension UIView {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() { endEditing(true) }
}
