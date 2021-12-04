//
//  Pen.swift
//  Drawing
//
//  Created by admin on 20.11.2021.
//  Copyright © 2021 Магжан Имангазин. All rights reserved.
//

import Foundation
import UIKit

class Pen{
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.stroke_width = stroke_width
    }
    func drawPath(){
        let path = UIBezierPath()
        
        color.set()
    }
}
