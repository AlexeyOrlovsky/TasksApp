//
//  CreateTaskViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 13.09.2023.
//

import UIKit
import SnapKit
import RealmSwift

class CreateTaskViewController: UIViewController {
    
    let titleToDoLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let toDoView: UIView = {
       let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        return view
    }()
    
    let toDoTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Do",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3])
        textField.font = .systemFont(ofSize: 18, weight: .bold)
        return textField
    }()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "Task"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let taskView: UIView = {
       let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        return view
    }()
    
    let taskTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "I need",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3])
        textField.font = .systemFont(ofSize: 18, weight: .bold)
        return textField
    }()
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.text = "Topic"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let topicView: UIView = {
       let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        return view
    }()
    
    let topicTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Homework",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray3])
        textField.font = .systemFont(ofSize: 18, weight: .bold)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewDidLoad()
        setupAddSubviews()
    }
    
    func setupViewDidLoad() {
        view.backgroundColor = .systemBackground
        title = "New task"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(rightBarButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func setupAddSubviews() {
        view.addSubview(titleToDoLabel)
        
        view.addSubview(toDoView)
        toDoView.addSubview(toDoTextField)
        
        view.addSubview(taskLabel)
        
        view.addSubview(taskView)
        taskView.addSubview(taskTextField)
        
        view.addSubview(topicLabel)
        
        view.addSubview(topicView)
        topicView.addSubview(topicTextField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        titleToDoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.left.equalToSuperview().inset(20)
        }
        
        toDoView.snp.makeConstraints { make in
            make.top.equalTo(titleToDoLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(40)
        }
        
        toDoTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
        }
        
        taskLabel.snp.makeConstraints { make in
            make.top.equalTo(toDoView.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(20)
        }
        
        taskView.snp.makeConstraints { make in
            make.top.equalTo(taskLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(40)
        }
        
        taskTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
        }
        
        topicLabel.snp.makeConstraints { make in
            make.top.equalTo(taskView.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(20)
        }
        
        topicView.snp.makeConstraints { make in
            make.top.equalTo(topicLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(40)
        }
        
        topicTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
        }
    }
}

/// @objc funcs
extension CreateTaskViewController {
    
    @objc func rightBarButtonAction() {
        

        /// dismiss
        navigationController?.popViewController(animated: true)
    }
}



// Array []

// Create item -> put in Array

// item in -> table
