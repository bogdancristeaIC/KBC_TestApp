//
//  CarInfoViewModelTests.swift
//  KBC_TestAppTests
//
//  Created by bogdan.cristea on 21.06.2024.
//

import Foundation
import XCTest

final class CarInfoViewModelTests: XCTestCase {
    
    func testInitialization() {
        let coordinator = AppCoordinatorMock(navigationController: UINavigationController())
        let model = CarInfoViewModel(coordinator: coordinator)
        XCTAssertNotNil(model.coordinator)
    }
    
    func testCarNameInvalid() {
        let coordinator = AppCoordinatorMock(navigationController: UINavigationController())
        let model = CarInfoViewModel(coordinator: coordinator)
        XCTAssertFalse(model.isCarNameValid("aa"))
    }
    
    func testCarNameThreeCharacters() {
        let coordinator = AppCoordinatorMock(navigationController: UINavigationController())
        let model = CarInfoViewModel(coordinator: coordinator)
        XCTAssertTrue(model.isCarNameValid("aaa"))
    }
    
    func testCarNameValid() {
        let coordinator = AppCoordinatorMock(navigationController: UINavigationController())
        let model = CarInfoViewModel(coordinator: coordinator)
        XCTAssertTrue(model.isCarNameValid("aaaa"))
    }
    
    func testNextButtonNilParameter() {
        let coordinator = AppCoordinatorMock(navigationController: UINavigationController())
        let model = CarInfoViewModel(coordinator: coordinator)
        
        var startSemaphoreFlowBlockCompleted = false
        coordinator.startSemaphoreFlowBlock = {
            startSemaphoreFlowBlockCompleted = true
        }

        model.nextButtonPressed(carName: nil)
        XCTAssertFalse(startSemaphoreFlowBlockCompleted)
    }
    
    func testNextButtonInvalidParameter() {
        let coordinator = AppCoordinatorMock(navigationController: UINavigationController())
        let model = CarInfoViewModel(coordinator: coordinator)
        
        var startSemaphoreFlowBlockCompleted = false
        coordinator.startSemaphoreFlowBlock = {
            startSemaphoreFlowBlockCompleted = true
        }

        model.nextButtonPressed(carName: "aa")
        XCTAssertFalse(startSemaphoreFlowBlockCompleted)
    }
    
    func testNextButtonValidParameter() {
        let coordinator = AppCoordinatorMock(navigationController: UINavigationController())
        let model = CarInfoViewModel(coordinator: coordinator)
        
        var startSemaphoreFlowBlockCompleted = false
        coordinator.startSemaphoreFlowBlock = {
            startSemaphoreFlowBlockCompleted = true
        }

        model.nextButtonPressed(carName: "aaa")
        XCTAssertTrue(startSemaphoreFlowBlockCompleted)
    }
    
}
