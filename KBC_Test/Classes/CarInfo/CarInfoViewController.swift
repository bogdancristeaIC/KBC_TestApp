//
//  CarInfoViewController.swift
//  KBC_TestApp
//
//  Created by bogdan.cristea on 20.06.2024.
//

import Foundation
import UIKit

class CarInfoViewController: UIViewController {

    // MARK: - Properties
    
    private let viewModel: CarInfoViewModel
    
    private let carNameTextView = UITextView()
    private let nextButton = UIButton()
    
    // MARK: - Initializers
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Use the designated initializer with a viewModel")
    }
    
    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Use the designated initializer with a viewModel")
    }

    init(viewModel: CarInfoViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setupConstraints()
    }

    // MARK: - Private
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.carNameTextView.textAlignment = .justified
        self.carNameTextView.backgroundColor = .lightGray
        self.carNameTextView.font = UIFont.systemFont(ofSize: 20)
        self.carNameTextView.textColor = .white
        self.carNameTextView.isEditable = true
        self.carNameTextView.layer.cornerRadius = 10
        self.carNameTextView.delegate = self
        self.view.addSubview(self.carNameTextView)
        
        self.nextButton.setTitle("Start Driving", for: .normal)
        self.nextButton.backgroundColor = .lightGray
        self.nextButton.setTitleColor(.white, for: .normal)
        self.nextButton.setTitleColor(.darkGray, for: .disabled)
        self.nextButton.layer.cornerRadius = 10
        self.nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchDown)
        self.nextButton.isEnabled = false
        self.view.addSubview(self.nextButton)
    }
    
    private func setupConstraints() {
        self.carNameTextView.translatesAutoresizingMaskIntoConstraints = false
        self.nextButton.translatesAutoresizingMaskIntoConstraints = false

        self.carNameTextView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50.0).isActive  = true
        self.carNameTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16.0).isActive = true
        self.carNameTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0).isActive = true
        self.carNameTextView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        self.nextButton.topAnchor.constraint(equalTo: self.carNameTextView.bottomAnchor, constant: 50.0).isActive  = true
        self.nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16.0).isActive = true
        self.nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0).isActive = true
        self.nextButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
    }
    
    // MARK: - Actions
    
    @objc private func nextButtonPressed() {
        self.viewModel.nextButtonPressed(carName: self.carNameTextView.text)
    }
    
}

extension CarInfoViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        self.nextButton.isEnabled = self.viewModel.isCarNameValid(textView.text)
    }
    
}
