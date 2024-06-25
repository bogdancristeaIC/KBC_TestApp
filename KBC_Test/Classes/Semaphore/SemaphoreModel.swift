//
//  SemaphoreModel.swift
//  KBC_TestApp
//
//  Created by bogdan.cristea on 20.06.2024.
//

import Foundation

public protocol SemaphoreSignals: AnyObject {
    func changeSemaphoreSignalToColor(_ color: SemaphoreColor)
}

public class SemaphoreModel {
    
    // MARK: - Properties
    
    private let carName: String
    private var semaphoreColor: SemaphoreColor?
    
    public weak var semaphoreSignal: SemaphoreSignals?
    public var displayCar: String {
        return self.carName
    }
    
    // MARK: - Initializers
    
    init(carName: String) {
        self.carName = carName
    }
    
    // MARK: - Public
    
    func startSemaphoreSignals(fromColor color: SemaphoreColor) {
        self.semaphoreColor = color
        self.semaphoreSignalForColor(color: .green, time: 4.0)
    }
    
    // MARK: - Private
    
    private func semaphoreSignalForColor(color: SemaphoreColor, time: TimeInterval) {
        self.semaphoreSignal?.changeSemaphoreSignalToColor(color)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: { [weak self] in
            if color == .green {
                self?.semaphoreSignalForColor(color: .orange, time: 1.0)
                self?.semaphoreColor = color
            } else if color == .orange {
                self?.semaphoreSignalForColor(color: (self?.semaphoreColor ?? .green) == .green ? .red : .green, time: 4.0)
            } else if color == .red {
                self?.semaphoreSignalForColor(color: .orange, time: 1.0)
                self?.semaphoreColor = color
            }
        })
    }
    
}
