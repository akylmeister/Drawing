//
//  Triangle.swift
//  Drawing
//
//  Created by admin on 10.10.2021.
//

import Foundation
import UIKit

class Triangle {
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
    private var color: UIColor
    private var isFilled: Bool
    
    init(p1: CGPoint, p2: CGPoint, p3: CGPoint, color: UIColor, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.color = color
        self.isFilled = isFilled
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        color.set()
        path.lineWidth = 4
        path.close()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
}
