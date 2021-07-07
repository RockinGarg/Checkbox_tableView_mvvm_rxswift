//
//  ChecklistCheckmark.swift
//  ChecklistUI
//
//  Created by Jatin Garg on 06/07/21.
//

import UIKit

@IBDesignable public class ChecklistCheckmark: UIButton {
    @IBInspectable public var checked: Bool = false {
        didSet { setNeedsDisplay() }
    }
    
    let desiredLineWidth: CGFloat = 1
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    public func setupView() {
        setNeedsLayout()
        setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        context.clear(rect)
        drawOuterSquare(frame: rect)
        if checked {
            drawInnerCheckMark(frame: rect)
        }
        
        context.endTransparencyLayer()
    }
    
    func drawOuterSquare(frame: CGRect) {
        let newRect = frame.insetBy(dx: 2 / 2, dy: 2 / 2)
        let squarePath = UIBezierPath(rect: newRect)
        UIColor.lightGray.setStroke()
        squarePath.stroke()
    }
    
    func drawOuterCircle(frame: CGRect) {
        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: halfSize, y: halfSize), radius: CGFloat( halfSize - (desiredLineWidth/2) ), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        UIColor.lightGray.setStroke()
        circlePath.lineWidth = 2
        circlePath.stroke()
    }
    
    func drawInnerCircle(frame: CGRect) {
        let halfSize: CGFloat = min(bounds.size.width/2, bounds.size.height/2)
        let newCirclePath = UIBezierPath(arcCenter: CGPoint(x: halfSize, y: halfSize), radius: CGFloat( halfSize/1.7 - (desiredLineWidth/2) ), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        UIColor.lightGray.setFill()
        newCirclePath.fill()
    }
    
    func drawInnerCheckMark(frame: CGRect) {
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.50000 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38000 * frame.width, y: frame.minY + 0.60000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42000 * frame.width, y: frame.minY + 0.62000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.70000 * frame.width, y: frame.minY + 0.24000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.78000 * frame.width, y: frame.minY + 0.30000 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.20000 * frame.width, y: frame.minY + 0.58000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44000 * frame.width, y: frame.minY + 0.76000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.26000 * frame.width, y: frame.minY + 0.62000 * frame.height))
        UIColor.lightGray.setFill()
        bezierPath.fill()
    }
}
