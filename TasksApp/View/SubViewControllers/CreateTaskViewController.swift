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
    
    let redBackground = UIColor(red: 118/255, green: 19/255, blue: 20/255, alpha: 1)
    let yellowBackground = UIColor(red: 154/255, green: 109/255, blue: 43/255, alpha: 1)
    let greenBackground = UIColor(red: 132/255, green: 163/255, blue: 45/255, alpha: 1)
    let darkGreenBackground = UIColor(red: 42/255, green: 149/255, blue: 104/255, alpha: 1)
    let purpleBackground = UIColor(red: 52/255, green: 140/255, blue: 146/255, alpha: 1)
        
        /// UI Elements
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
    
    /// UI Topic Buttons
    let homeTopicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Home", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let sportTopicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sport", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let helpTopicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Help", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let educationTopicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Education", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let otherTopicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Other", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewDidLoad()
        setupAddSubviews()
        setupTopicButtonsBackgrounds()
        setupButtonActions()
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
        
        view.addSubview(homeTopicButton)
        view.addSubview(sportTopicButton)
        view.addSubview(helpTopicButton)
        view.addSubview(educationTopicButton)
        view.addSubview(otherTopicButton)
    }
    
    func setupButtonActions() {
        homeTopicButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        sportTopicButton.addTarget(self, action: #selector(sportButtonAction), for: .touchUpInside)
        helpTopicButton.addTarget(self, action: #selector(helpButtonAction), for: .touchUpInside)
        educationTopicButton.addTarget(self, action: #selector(educationButtonAction), for: .touchUpInside)
        otherTopicButton.addTarget(self, action: #selector(otherButtonAction), for: .touchUpInside)
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
        
        homeTopicButton.snp.makeConstraints { make in
            make.top.equalTo( topicView.snp.bottom).offset(6)
            make.left.equalTo(topicView.snp.left)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        sportTopicButton.snp.makeConstraints { make in
            make.top.equalTo(topicView.snp.bottom).offset(6)
            make.left.equalTo(homeTopicButton.snp.right).offset(5)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        helpTopicButton.snp.makeConstraints { make in
            make.top.equalTo(topicView.snp.bottom).offset(6)
            make.left.equalTo(sportTopicButton.snp.right).offset(5)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        educationTopicButton.snp.makeConstraints { make in
            make.top.equalTo(topicView.snp.bottom).offset(6)
            make.left.equalTo(helpTopicButton.snp.right).offset(5)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        otherTopicButton.snp.makeConstraints { make in
            make.top.equalTo(topicView.snp.bottom).offset(6)
            make.left.equalTo(educationTopicButton.snp.right).offset(5)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
    }
    
    func setupTopicButtonsBackgrounds() {
        homeTopicButton.backgroundColor = redBackground
        sportTopicButton.backgroundColor = yellowBackground
        helpTopicButton.backgroundColor = greenBackground
        educationTopicButton.backgroundColor = darkGreenBackground
        otherTopicButton.backgroundColor = purpleBackground
    }
}

/// @objc funcs
extension CreateTaskViewController {
    
    @objc func rightBarButtonAction() {
        
        let realm = try? Realm()
        
        guard let title = toDoTextField.text, !title.isEmpty,
              let taskDescription = taskTextField.text, !taskDescription.isEmpty,
              let topic = topicTextField.text, !topic.isEmpty else { fullFields(); return }
        
        let task = Task()
        task.title = title
        task.taskDescription = taskDescription
        task.topic = topic
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(task)
            }
        } catch {
            /// error handling seving in Realm
            print("Ошибка сохранения задачи: \(error.localizedDescription)")
        }
        
        /// dismiss
        navigationController?.popViewController(animated: true)
    }
    
    @objc func homeButtonAction() {
        topicTextField.text = "Homework"
    }
    
    @objc func sportButtonAction() {
        topicTextField.text = "Sport"
    }
    
    @objc func helpButtonAction() {
        topicTextField.text = "Help"
    }
    
    @objc func educationButtonAction() {
        topicTextField.text = "Education"
    }
    
    @objc func otherButtonAction() {
        topicTextField.text = "Other"
    }
}

/// Alerts
extension CreateTaskViewController {
    
    func fullFields() {
        let alert = UIAlertController(title: "Field is not full", message: "Fields: title, description, topic must be full", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}
