//
//  GyroscopeView.swift
//  Nano 2
//
//  Created by Airyne Liu on 24/05/23.
//

import SwiftUI
import CoreMotion

//struct GyroscopeView: View {
//    @State private var xRotation: Double = 0
//    @State private var yRotation: Double = 0
//    @State private var zRotation: Double = 0
//
//    let motionManager = CMMotionManager()
//
//    var body: some View {
//        VStack {
//            Text("Rotation Rate")
//                .font(.title)
//
//            Text("X: \(xRotation, specifier: "%.2f")")
//            Text("Y: \(yRotation, specifier: "%.2f")")
//            Text("Z: \(zRotation, specifier: "%.2f")")
//
//            if yRotation > 0 {
//                Text("Turning Left")
//            } else if yRotation < 0 {
//                Text("Turning Right")
//            } else {
//                Text("Not Turning")
//
//
//            }
//        }
//        .padding()
//        .onAppear {
//            if motionManager.isGyroAvailable {
//                motionManager.gyroUpdateInterval = 0.1
//
//                motionManager.startGyroUpdates(to: .main) { (data, error) in
//                    if let rotationRate = data?.rotationRate {
//                        xRotation = rotationRate.x
//                        yRotation = rotationRate.y
//                        zRotation = rotationRate.z
//                    }
//                }
//            }
//        }
//        .onDisappear {
//            motionManager.stopGyroUpdates()
//        }
//    }
//}
//
//
//struct GyroscopeView_Previews: PreviewProvider {
//    static var previews: some View {
//        GyroscopeView()
//    }
//}


class AccelerometerManager: ObservableObject {
    let motionManager = CMMotionManager()
    
    @Published var movementDirection: String = ""
    private var delayed = false
    
    init() {
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

struct ContentView: View {
    @StateObject private var accelerometerManager = AccelerometerManager()
    
    var body: some View {
        VStack {
            Text("Device Movement:")
            Text(accelerometerManager.movementDirection)
                .font(.headline)
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
