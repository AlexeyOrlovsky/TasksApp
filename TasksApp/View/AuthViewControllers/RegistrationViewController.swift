//
//  RegistrationViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
    
    /// TextField letters colors
    let textFieldLettersColors = [
        UIColor(red: 188/255, green: 109/255, blue: 166/255, alpha: 1),
        UIColor(red: 134/255, green: 210/255, blue: 72/255, alpha: 1),
        UIColor(red: 65/255, green: 199/255, blue: 151/255, alpha: 1),
        UIColor(red: 234/255, green: 216/255, blue: 46/255, alpha: 1),
        UIColor(red: 111/255, green: 59/255, blue: 195/255, alpha: 1),
        UIColor(red: 63/255, green: 114/255, blue: 195/255, alpha: 1),
        UIColor(red: 190/255, green: 211/255, blue: 72/255, alpha: 1)
    ]
    
    /// UI Elements
    let titleVCLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let stripButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 42/255, green: 149/255, blue: 104/255, alpha: 1)
        button.layer.cornerRadius = 3
        return button
    }()
    
    let nameView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .black
        return view
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBackground])
        textField.font = .systemFont(ofSize: 24, weight: .bold)
        return textField
    }()
    
    let emailView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .black
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBackground])
        textField.font = .systemFont(ofSize: 24, weight: .bold)
        return textField
    }()
    
    let passwordView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .black
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBackground])
        textField.font = .systemFont(ofSize: 24, weight: .bold)
        return textField
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewDidLoad()
        setupAddSubviews()
        setupButtonActions()
        textFieldsLettersColors()
    }
    
    func setupViewDidLoad() {
        view.backgroundColor = .systemBackground
    }
    
    func setupAddSubviews() {
        view.addSubview(stripButton)
        view.addSubview(titleVCLabel)
        
        view.addSubview(nameView)
        nameView.addSubview(nameTextField)
        
        view.addSubview(emailView)
        emailView.addSubview(emailTextField)
        
        view.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        
        view.addSubview(createAccountButton)
    }
    
    func setupButtonActions() {
        stripButton.addTarget(self, action: #selector(hideCurrentViewController), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createUserAccount), for: .touchUpInside)
    }
    
    /// Constraints
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stripButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.width.equalTo(50)
            make.height.equalTo(5)
        }
        
        titleVCLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(160)
        }
        
        nameView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleVCLabel.snp.bottom).offset(28)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(280)
        }
        
        emailView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameView.snp.bottom).offset(8)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(280)
        }
        
        passwordView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailView.snp.bottom).offset(8)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(280)
        }
        
        createAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordView.snp.bottom).offset(8)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    func textFieldsLettersColors() {
        nameTextField.textColor = random(colors: textFieldLettersColors)
        emailTextField.textColor = random(colors: textFieldLettersColors)
        passwordTextField.textColor = random(colors: textFieldLettersColors)
    }
}

/// @objc funcs
extension RegistrationViewController {
    
    @objc func hideCurrentViewController() {
        dismiss(animated: true)
    }
    
    @objc func createUserAccount() {
       
        guard let name = emailTextField.text, !name.isEmpty, name.count > 2,
              let email = emailTextField.text, !email.isEmpty,
              let password = emailTextField.text, !password.isEmpty, password.count > 5 else { return }
        
        createUserAtFirebase(email: email, password: password)
        dismiss(animated: true)
    }
    
    func createUserAtFirebase(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func saveUserStageInRealm() {
        
    }
}

/// Alerts
extension RegistrationViewController {
    //
}

/// random color
extension RegistrationViewController {

    func random(colors: [UIColor]) -> UIColor {
        return colors[Int(arc4random_uniform(UInt32(textFieldLettersColors.count)))]
     }
}
