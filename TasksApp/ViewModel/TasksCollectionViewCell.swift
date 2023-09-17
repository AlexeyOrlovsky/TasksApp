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
    let titleLabel = UILabel()
    let taskDescription = UILabel()
    let topic = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(taskDescription)
        contentView.addSubview(topic)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(340)
        }
        
        taskDescription.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(340)
        }
        
        topic.snp.makeConstraints { make in
            make.top.equalTo(taskDescription.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(340)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
