//
//  Particle.swift
//  Motion
//
//  Created by Giovanni Gaffé on 2022/1/27.
//

import Foundation

struct Particle: Hashable {
    let x: Double
    let y: Double
    let creationDate = Date.now.timeIntervalSinceReferenceDate
}
