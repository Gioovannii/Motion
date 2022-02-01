//
//  MotionManager.swift
//  Motion
//
//  Created by Giovanni Gaffé on 2022/2/1.
//

import CoreMotion

class MotionManager {
    private var motionManager = CMMotionManager()
    var pitch = 0.0
    var roll = 0.0
    var yaw = 0.0

    init() {
        motionManager.startGyroUpdates(to: OperationQueue()) { [weak self] motion, error in
            guard let self = self, let motion = motion else { return }
            self.pitch
        }
    }
}
