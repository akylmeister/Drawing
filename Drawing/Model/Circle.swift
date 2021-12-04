//
//  Circle.swift
//  Drawing
//
//  Created by admin on 10.10.2021.
//

import Foundation
import UIKit

protocol add{
    func add()
}

class Circle {
    private var radius: CGFloat
    private var circle_center: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat
    private var isFilled: Bool
    private var delegate: add?
    
    init(with radius: CGFloat, and circle_center: CGPoint, withSome color: UIColor, and stroke_width: CGFloat, isFilled: Bool) {
        self.circle_center = circle_center
        self.color = color
        self.radius = radius
        self.isFilled = isFilled
        self.stroke_width = stroke_width
    }
    
    func drawPath() {
        let path = UIBezierPath(arcCenter: circle_center,
                                radius: radius,
                                startAngle: 0,
                                endAngle: 2 * Double.pi.cg,
                                clockwise: true)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
        path.stroke()
    }
}

extension Double {
    var cg: CGFloat {
        return CGFloat(self)
    }
}
