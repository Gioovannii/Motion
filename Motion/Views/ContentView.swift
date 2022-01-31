//
//  ContentView.swift
//  Motion
//
//  Created by Giovanni Gaffé on 2022/1/27.
//

import SwiftUI

struct ContentView: View {
    @State private var particleSystem = ParticleSystem()
    
    let options: [(flipX: Bool, flipY: Bool)] = [
        (false, false),
        (true, false),
        (false, true),
        (true, true)
    ]
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let timelineData = timeline.date.timeIntervalSinceReferenceDate
                particleSystem.update(date: timelineData)
                context.blendMode = .plusLighter
                
                //context.addFilter(.colorMultiply(.green))
                
                for particle in particleSystem.particles {
                    var contextCopy = context
                    contextCopy.addFilter(.colorMultiply(Color(hue: particle.hue, saturation: 1, brightness: 1)))
                    contextCopy.opacity = 1 - (timelineData - particle.creationDate)
                    
                    for option in options {
                        let xPos = particle.x * size.width
                        let yPos = particle.y * size.height
                        
                        contextCopy.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
                    }
                    
                    
                    // MARK: - Rainbow
                    
                    //                    var contextCopy = context
                    //                    contextCopy.addFilter(.colorMultiply(Color(hue: particle.hue, saturation: 1, brightness: 1)))
                    //                    contextCopy.opacity = 1 - (timelineData - particle.creationDate)
                   
                    
                    
                    //                    // MARK: - Make particle blur when we drag
                    //                    context.opacity = 1 - (timelineData - particle.creationDate)
                    
                    //                    context.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
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
