//
//  CustomView.swift
//  Drawing
//
//  Created by admin on 10.10.2021.
//

import UIKit

class CustomView: UIView {
    var point1: CGPoint?
    var point2: CGPoint!
    
    var tags = 0
    var button = UIButton()
    var isSwiping:Bool!
    
    @IBOutlet weak var circleBt: UIButton!
    @IBOutlet weak var RectBt: UIButton!
    @IBOutlet weak var LineBt: UIButton!
    @IBOutlet weak var TriangleBt: UIButton!
    @IBOutlet weak var PenBt: UIButton!
    @IBOutlet weak var FillSwitch: UISwitch!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        tags = sender.tag
    }
    @IBAction func colorChange(_ sender: UIButton) {
        button.backgroundColor = sender.backgroundColor
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if let p1 = point1 {
            if tags == circleBt.tag {
                let circle = Circle(with: abs(point2.x - p1.x), and: p1, withSome: button.backgroundColor ?? .black, and: 4, isFilled: (FillSwitch.isOn) ? true : false)
                circle.drawPath()
                lines.append([CGPoint]())
            }
            else if tags == LineBt.tag {
                let line1 = Line(p1: p1, p2: point2, color: button.backgroundColor ?? .black)
                line1.drawPath()
                lines.append([CGPoint]())
            } else if tags == RectBt.tag {
                let rect = Rectangle.init(p1: p1, p2: point2, color: button.backgroundColor ?? .black, stroke_width: 4, isFilled: (FillSwitch.isOn) ? true : false)
                rect.drawPath()
                lines.append([CGPoint]())
            } else if tags == TriangleBt.tag {
                let triangle = Triangle(p1: p1, p2: point2, p3: CGPoint(x: p1.x, y: point2.y), color: button.backgroundColor ?? .black, isFilled: (FillSwitch.isOn) ? true : false)
                triangle.drawPath()
                lines.append([CGPoint]())
            } else {
                drawWithPen()
            }
            setNeedsDisplay()
        }
    }
    
    func drawWithPen() {
        let path = UIBezierPath()
        path.lineWidth = 5
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    path.move(to: p)
                } else {
                    path.addLine(to: p)
                }
            }
        }
        path.stroke()
    }
    
    var lines = [[CGPoint]]()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSwiping = false
        if let touch = touches.first {
            point1 = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            point2 = touch.location(in: self)
        }
        lines.append([CGPoint]())
        setNeedsDisplay()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSwiping = true
        guard let point = touches.first?.location(in: nil) else {return}
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        point2 = lastLine.first
        lines.append((lastLine))
        setNeedsDisplay()
    }
    
    
}
