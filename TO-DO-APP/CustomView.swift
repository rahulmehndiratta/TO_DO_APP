//
//  CustomView.swift
//  TO-DO-APP
//
//  Created by Rahul on 29/05/23.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    let strokeShape = CAShapeLayer()
    
    @IBInspectable
    var cornerRadius: CGFloat = 0{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var topLeftRadius: Bool = true{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var topRightRadius: Bool = true{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var bottomLeftRadius: Bool = true{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var bottomRightRadius: Bool = true{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var strokeWidth: CGFloat = 0{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var strokeColor: UIColor = .clear{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var gradientAngle: CGFloat = 0{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var gradientStartColor: UIColor? = nil{
        didSet{
            updateStyles()
        }
    }
    
    @IBInspectable
    var gradientEndColor: UIColor? = nil{
        didSet{
            updateStyles()
        }
    }
    
    func createDottedLine(width: CGFloat, color: CGColor) {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color
        caShapeLayer.lineWidth = width
        caShapeLayer.lineDashPattern = [1,1]
        let cgPath = CGMutablePath()
        let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        layer.addSublayer(caShapeLayer)
    }
    
    private func updateStyles(){
        var corners = UIRectCorner.init()
        if topLeftRadius{
            corners.update(with: .topLeft)
        }
        if topRightRadius{
            corners.update(with: .topRight)
        }
        if bottomLeftRadius{
            corners.update(with: .bottomLeft)
        }
        if bottomRightRadius{
            corners.update(with: .bottomRight)
        }
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
        
        strokeShape.path = path.cgPath
        strokeShape.strokeColor = strokeColor.cgColor
        strokeShape.fillColor = UIColor.clear.cgColor
        strokeShape.borderWidth = strokeWidth
        if self.layer.sublayers?.contains(strokeShape) != true{
            self.layer.addSublayer(strokeShape)
        }
        
        self.layer.borderWidth = 0
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateStyles()
    }
}
