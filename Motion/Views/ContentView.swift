//
//  ContentView.swift
//  Motion
//
//  Created by Giovanni Gaffé on 2022/1/27.
//

import SwiftUI

struct ContentView: View {
    @State private var particleSystem = ParticleSystem()
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let timelineData = timeline.date.timeIntervalSinceReferenceDate
                particleSystem.update(date: timelineData)
                
                for particle in particleSystem.particles {
                    let xPos = particle.x * size.width
                    let yPos = particle.y * size.height
                    
                    context.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
                }
            }
        }
        .gesture(DragGesture(minimumDistance: 0)
                    .onChanged { drag in
            particleSystem.center.x = drag.location.x / UIScreen.main.bounds.width
            particleSystem.center.y = drag.location.y / UIScreen.main.bounds.height

        })
        .ignoresSafeArea()
        .background(.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
