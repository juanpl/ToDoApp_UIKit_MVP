//
//  TaskCollectionViewCell.swift
//  ToDoApp_UIKit_MVP
//
//  Created by Juan Pablo Lasprilla Correa on 28/11/24.
//

import Foundation
import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Task Title"
        return label
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        let starImage = UIImage(systemName: "star", withConfiguration: config)
        
        button.setImage(starImage, for: .normal)
        button.addTarget(self, action: #selector(didTapOnFavorite), for: .touchDown)
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    private lazy var trashButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        let trashImage = UIImage(systemName: "trash", withConfiguration: config)
        
        button.setImage(trashImage, for: .normal)
        button.addTarget(self, action: #selector(didTapOnRemove), for: .touchDown)
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    private lazy var buttonsStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starButton, trashButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, buttonsStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        contentView.addSubview(mainStackView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    @objc
    func didTapOnFavorite() {
        //TODO
    }
    
    @objc
    func didTapOnRemove() {
        //TODO
    }
    
    func config(id: UUID, text: String, isFavorite:Bool){
        self.titleLabel.text = text
        let buttonImage = UIImage(systemName: isFavorite ? "star.fill" : "star")
        starButton.setImage(buttonImage, for: .normal)
    }

         
}
