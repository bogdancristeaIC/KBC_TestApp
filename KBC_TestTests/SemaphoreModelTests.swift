//
//  SemaphoreModelTests.swift
//  KBC_TestAppTests
//
//  Created by bogdan.cristea on 21.06.2024.
//

import Foundation
import XCTest

final class SemaphoreModelTests: XCTestCase {
    
    func testInitialization() {
        let model = SemaphoreModel(carName: "CarName")
        XCTAssertEqual(model.displayCar, "CarName")
    }
    
    func testSemaphoreSignals() {
        let semaphoreSignalsMock = SemaphoreSignalsMock()
        let model = SemaphoreModel(carName: "CarName")
        model.semaphoreSignal = semaphoreSignalsMock
        
        var semaphoreColor = SemaphoreColor.red
        semaphoreSignalsMock.semaphoreSignalBlock = { color in
            semaphoreColor = color
        }
        
        model.startSemaphoreSignals(fromColor: .green)
        XCTAssertEqual(semaphoreColor, SemaphoreColor.green)
        
        let exp1 = expectation(description: "Test after 4 seconds")
        _ = XCTWaiter.wait(for: [exp1], timeout: 4.0)
     
        semaphoreSignalsMock.semaphoreSignalBlock = { color in
            semaphoreColor = color
        }
        XCTAssertEqual(semaphoreColor, SemaphoreColor.orange)
        
        let exp2 = expectation(description: "Test after 1 second")
        _ = XCTWaiter.wait(for: [exp2], timeout: 1.0)
     
        semaphoreSignalsMock.semaphoreSignalBlock = { color in
            semaphoreColor = color
        }
        XCTAssertEqual(semaphoreColor, SemaphoreColor.red)
    }
    
}
