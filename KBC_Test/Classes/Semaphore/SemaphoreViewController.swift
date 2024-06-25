//
//  SemaphoreViewController.swift
//  KBC_TestApp
//
//  Created by bogdan.cristea on 20.06.2024.
//

import UIKit

class SemaphoreViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: SemaphoreModel
    
    private let carNameLabel = UILabel()
    private let semaphoreView = SemaphoreView()
    
    // MARK: - Initializers
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Use the designated initializer with a viewModel")
    }
    
    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Use the designated initializer with a viewModel")
    }

    init(viewModel: SemaphoreModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.backgroundColor = .white
        self.setupUI()
        self.setupConstraints()
        
        self.viewModel.semaphoreSignal = self
        self.viewModel.startSemaphoreSignals(fromColor: .green)
    }
    
    // MARK: - Private
    
    private func setupUI() {
        self.carNameLabel.textColor = .black
        self.carNameLabel.textAlignment = .center
        self.carNameLabel.text = self.viewModel.displayCar
        
        self.view.addSubview(self.carNameLabel)
        self.view.addSubview(self.semaphoreView)
    }
    
    private func setupConstraints() {
        self.carNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.semaphoreView.translatesAutoresizingMaskIntoConstraints = false
       
        self.carNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50.0).isActive  = true
        self.carNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16.0).isActive = true
        self.carNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0).isActive = true
        self.carNameLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true

        self.semaphoreView.topAnchor.constraint(equalTo: self.carNameLabel.bottomAnchor, constant: 50.0).isActive  = true
        self.semaphoreView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        self.semaphoreView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        self.semaphoreView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
}

extension SemaphoreViewController: SemaphoreSignals {
    
    func changeSemaphoreSignalToColor(_ color: SemaphoreColor) {
        self.semaphoreView.activeColor = color
    }
    
}
