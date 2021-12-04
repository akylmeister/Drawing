//
//  Line.swift
//  Drawing
//
//  Created by admin on 10.10.2021.
//

import Foundation
import UIKit

class Line {
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.close()
        color.set()
        path.lineWidth = 4
        path.stroke()
    }
}
