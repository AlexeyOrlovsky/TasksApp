//
//  TextLettersColor.swift
//  TasksApp
//
//  Created by Алексей Орловский on 10.09.2023.
//

import Foundation
import UIKit

/// RegistrationViewController
extension RegistrationViewController {
    
    /// random color
    func random(colors: [UIColor]) -> UIColor {
        return colors[Int(arc4random_uniform(UInt32(textFieldLettersColors.count)))]
     }
}

extension LoginViewController {
    
    /// random color
    func random(colors: [UIColor]) -> UIColor {
        return colors[Int(arc4random_uniform(UInt32(textFieldLettersColors.count)))]
     }
}
