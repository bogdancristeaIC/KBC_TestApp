//
//  SemaphoreView.swift
//  KBC_TestApp
//
//  Created by bogdan.cristea on 20.06.2024.
//

import UIKit

public enum SemaphoreColor {
    case red
    case orange
    case green
}

class SemaphoreView: UIView {
    
    // MARK: - Properties
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 3
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .green
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        
        return view
    }()
    
    private var orangeView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .orange
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        
        return view
    }()
    
    private var redView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        
        return view
    }()
    
    var activeColor: SemaphoreColor = .green {
        didSet {
            self.setupSemaphore()
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
        
    // MARK: - Private
    
    private func setup() {
        self.setupViews()
        self.setupConstraints()
    }
    
    private func setupViews() {
        self.contentStackView.addArrangedSubview(self.redView)
        self.contentStackView.addArrangedSubview(self.orangeView)
        self.contentStackView.addArrangedSubview(self.greenView)
        
        self.addSubview(self.contentStackView)
        
        self.setupSemaphore()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupSemaphore() {
        switch self.activeColor {
        case .red:
            self.animateSemaphoreViews(red: 1.0)
        case .orange:
            self.animateSemaphoreViews(orange: 1.0)
        case .green:
            self.animateSemaphoreViews(green: 1.0)
        }
    }
    
    private func animateSemaphoreViews(green: CGFloat = 0.3, orange: CGFloat = 0.3, red: CGFloat = 0.3) {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.greenView.alpha = green
            self?.orangeView.alpha = orange
            self?.redView.alpha = red
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.greenView.layer.cornerRadius = self.frame.width / 2
        self.orangeView.layer.cornerRadius = self.frame.width / 2
        self.redView.layer.cornerRadius = self.frame.width / 2
    }
    
}
