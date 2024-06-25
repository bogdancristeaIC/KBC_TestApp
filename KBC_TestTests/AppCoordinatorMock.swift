//
//  AppCoordinatorMock.swift
//  KBC_TestAppTests
//
//  Created by bogdan.cristea on 21.06.2024.
//

import Foundation
import UIKit

class AppCoordinatorMock: AppCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.startCarInfoFlow()
    }
    
    var startCarInfoFlowBlock: (() -> Void)?
    func startCarInfoFlow() {
        self.startCarInfoFlowBlock?()
    }
    
    var startSemaphoreFlowBlock: (() -> Void)?
    func startSemaphoreFlow(carName: String) {
        self.startSemaphoreFlowBlock?()
    }
    
}
