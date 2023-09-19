//
//  TasksCollectionViewCell.swift
//  TasksApp
//
//  Created by Алексей Орловский on 16.09.2023.
//

import UIKit
import SnapKit

class TasksCollectionViewCell: UICollectionViewCell {

    /// UI Elements
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .lightText
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .lightText
        return button
    }()
    
    var deleteAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(taskDescriptionLabel)
        contentView.addSubview(topicLabel)
        contentView.addSubview(deleteButton)
        
        deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
        }
        
        taskDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
        }
        
        topicLabel.snp.makeConstraints { make in
            make.top.equalTo(taskDescriptionLabel.snp.bottom).offset(2)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// @objc funcs
extension TasksCollectionViewCell {
    
    @objc func deleteButtonAction() {
        deleteAction?()
    }
}
