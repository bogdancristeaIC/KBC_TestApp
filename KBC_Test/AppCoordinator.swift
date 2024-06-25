//
//  AppCoordinator.swift
//  KBC_TestApp
//
//  Created by bogdan.cristea on 20.06.2024.
//

import Foundation
import UIKit

protocol AppCoordinator: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
    func startCarInfoFlow()
    func startSemaphoreFlow(carName: String)
}

class BaseAppCoordinator: AppCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.startCarInfoFlow()
    }
    
    func startCarInfoFlow() {
        let carInfoViewModel = CarInfoViewModel(coordinator: self)
        let carInfoViewController = CarInfoViewController(viewModel: carInfoViewModel)

        self.navigationController.pushViewController(carInfoViewController, animated: true)
    }
    
    func startSemaphoreFlow(carName: String) {
        let semaphoreModel = SemaphoreModel(carName: carName)
        let semaphoreViewController = SemaphoreViewController(viewModel: semaphoreModel)
        
        self.navigationController.pushViewController(semaphoreViewController, animated: true)
    }
    
}
