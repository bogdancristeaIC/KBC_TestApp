//
//  CarInfoViewModel.swift
//  KBC_TestApp
//
//  Created by bogdan.cristea on 20.06.2024.
//

import Foundation

public struct CarInfoViewModel {
    
    // MARK: - Properties
    
    weak var coordinator : AppCoordinator?
    
    // MARK: - Initializers
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public
    
    func isCarNameValid(_ carName: String?) -> Bool {
        guard let name = carName else {
            return false
        }
        
        return name.count >= 3
    }
    
    func nextButtonPressed(carName: String?) {
        guard let name = carName, self.isCarNameValid(name) else {
            return
        }
        
        self.coordinator?.startSemaphoreFlow(carName: name)
    }
    
}
