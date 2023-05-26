//
//  GyroscopeView.swift
//  Nano 2
//
//  Created by Airyne Liu on 24/05/23.
//

import SwiftUI
import CoreMotion


class AccelerometerManager: ObservableObject {
    let motionManager = CMMotionManager()
    
    @Published var movementDirection: String
    private var delayed = false
    
    init(movementDirection: String) {
        self.movementDirection = movementDirection
        startAccelerometerUpdates()
    }
    
    func startAccelerometerUpdates() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.4
            
            motionManager.startAccelerometerUpdates(to: .main) { (accelerometerData, error) in
                if let acceleration = accelerometerData?.acceleration {
                    let accelerationX = acceleration.x
                    print("X axis: \(accelerationX)")
                    
                    if !self.delayed {
                        if accelerationX > 0.8 {
                            self.movementDirection = "right"
                        } else if accelerationX < -0.8 {
                            self.movementDirection = "left"
                        } else {
                            self.movementDirection = "none"
                        }
                    }
                    
                    self.delayed = true
                    Timer(timeInterval: 1.0, repeats: false) { _ in
                        self.delayed = false
                    }.fire()
                }
            }
        }
    }
    
    func stopAccelerometerUpdates() {
        motionManager.stopAccelerometerUpdates()
    }
}
