//
//  LoginViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit
import SnapKit
import RealmSwift
import FirebaseAuth

class LoginViewController: UIViewController {
    
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
    let stripButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 155/255, green: 109/255, blue: 42/255, alpha: 1)
        button.layer.cornerRadius = 3
        return button
    }()
    
    let titleVCLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBackground])
        textField.font = .systemFont(ofSize: 24, weight: .bold)
        return textField
    }()
    
    let passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBackground])
        textField.font = .systemFont(ofSize: 24, weight: .bold)
        return textField
    }()
    
    let nextStageButton: UIButton = {
      let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = .black
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
        
        view.addSubview(emailView)
        emailView.addSubview(emailTextField)
        
        view.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        
        view.addSubview(nextStageButton)
    }
    
    func setupButtonActions() {
        stripButton.addTarget(self, action: #selector(hideCurrentViewController), for: .touchUpInside)
        nextStageButton.addTarget(self, action: #selector(nextStageButtonAction), for: .touchUpInside)
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
            make.top.equalToSuperview().inset(140)
        }
        
        emailView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleVCLabel.snp.bottom).offset(28)
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
        
        nextStageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordView.snp.bottom).offset(8)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    func textFieldsLettersColors() {
        emailTextField.textColor = random(colors: textFieldLettersColors)
        passwordTextField.textColor = random(colors: textFieldLettersColors)
    }
}

/// @objc funcs
extension LoginViewController {
    
    @objc func nextStageButtonAction() {
        
        guard let email = emailTextField.text, !email.isEmpty,
              let password = emailTextField.text, !password.isEmpty else { return }
        
        checkExistsUserInFirebase(email: email, password: password)
    }
    
    func checkExistsUserInFirebase(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [self] authResult, error in
            guard let result = authResult, error == nil else { return }
            
            _ = result.user
            
            saveUserInRealm(email: email, password: password)
        }
    }
    
    func saveUserInRealm(email: String, password: String) {
        let saveUser = UserAccountModel()
        saveUser.email = email
        saveUser.password = password
        
        let realm = try! Realm()
        try! realm.write({
            realm.add(saveUser)
            NavigationManager.shared.showAuthUserStage()
        })
    }
    
    @objc func hideCurrentViewController() {
        dismiss(animated: true)
    }
}

/// Alerts
extension LoginViewController {
    //
}

/// random color
extension LoginViewController {
    func random(colors: [UIColor]) -> UIColor {
        return colors[Int(arc4random_uniform(UInt32(textFieldLettersColors.count)))]
     }
}

