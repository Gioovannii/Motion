//
//  ParticleSystem.swift
//  Motion
//
//  Created by Giovanni Gaffé on 2022/1/27.
//

import SwiftUI

class ParticleSystem {
    let image = Image("spark")
    var particles = Set<Particle>()
    var center = UnitPoint.center
    
    func update(date: TimeInterval) {
        let newParticle = Particle(x: center.x, y: center.y)
        particles.insert(newParticle)
    }
}
