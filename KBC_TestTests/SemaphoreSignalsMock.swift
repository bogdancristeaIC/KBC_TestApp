//
//  SemaphoreSignalsMock.swift
//  KBC_TestAppTests
//
//  Created by bogdan.cristea on 21.06.2024.
//

import Foundation

class SemaphoreSignalsMock: SemaphoreSignals {
    
    var semaphoreSignalBlock: ((SemaphoreColor) -> Void)?
    func changeSemaphoreSignalToColor(_ color: SemaphoreColor) {
        semaphoreSignalBlock?(color)
    }
    
}
