//
//  WelcomeViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    /// UI Elements
    let loginVCButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    let regVCButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create account", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupAddSubviews()
        setupButtonActions()
    }
    
    func setupAddSubviews() {
        view.addSubview(loginVCButton)
        view.addSubview(regVCButton)
    }
    
    func setupButtonActions() {
        loginVCButton.addTarget(self, action: #selector(showLoginVCButtonAction), for: .touchUpInside)
        regVCButton.addTarget(self, action: #selector(showRegVCButtonAction), for: .touchUpInside)
    }
    
    /// Constraints
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loginVCButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(140)
        }
        
        regVCButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
    }
}

/// @objc funcs
extension WelcomeViewController {
    
    @objc func showLoginVCButtonAction() {
        let vc = LoginViewController()
        present(vc, animated: true)
    }
    
    @objc func showRegVCButtonAction() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
}
