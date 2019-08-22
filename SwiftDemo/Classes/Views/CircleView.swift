//
//  CircleView.swift
//  SwiftDemo
//
//  Created by silicn on 2019/5/17.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var shaperLayer:CAShapeLayer!
    
    var rotationLayer:CALayer!
    
    var animationZ:CABasicAnimation!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        drawCircle();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   public func drawCircle(){
        
        let layer = CALayer()
        layer.frame = self.bounds
        layer.backgroundColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
        
        
        
        self.rotationLayer = layer
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: layer.frame.size.width/2, y: layer.frame.size.height/2), radius: 100, startAngle: CGFloat(-Double.pi/2), endAngle: CGFloat(3/2 * Double.pi - 1), clockwise: true)
        
        let shaperLayer = CAShapeLayer()
        shaperLayer.lineCap = .round
        shaperLayer.fillColor = UIColor.clear.cgColor
        shaperLayer.strokeColor = UIColor.red.cgColor
        shaperLayer.lineWidth = 5.0
        shaperLayer.path = path.cgPath
        self.shaperLayer = shaperLayer
        layer.addSublayer(shaperLayer)
    
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.3
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut) 
        shaperLayer.add(animation, forKey: "animation")
        
        let animationZ = CABasicAnimation(keyPath: "transform.rotation.z")
        animationZ.fromValue = 0
        animationZ.toValue = 2 * Double.pi
        animationZ.repeatCount = HUGE
        animationZ.duration = 0.6
        animationZ.beginTime = CACurrentMediaTime() + 0.3
        animationZ.isRemovedOnCompletion = false
        animationZ.fillMode = CAMediaTimingFillMode.forwards
        
        self.animationZ = animationZ
    
        layer.add(animationZ, forKey: "animationZ")
        self.perform(#selector(endAnimation), with: nil, afterDelay: 4)
        
    }
    
   @objc func endAnimation(){
    
    let pausedTime = self.rotationLayer.convertTime(CACurrentMediaTime(), from: nil)
    self.rotationLayer.speed = 0.00001
    self.rotationLayer.timeOffset = pausedTime

    self.shaperLayer.speed = 1/self.rotationLayer.speed;
    let animation = CABasicAnimation(keyPath: "strokeStart")
    animation.duration = 0.3
    animation.fromValue = 0.0
    animation.toValue = 1.0
    animation.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut ) 
    animation.isRemovedOnCompletion = false
    self.shaperLayer.add(animation, forKey: "start")
        
    self .perform(#selector(dismiss), with: nil, afterDelay: 0.28)
    }
    
    @objc func dismiss(){
        self.layer.removeAllAnimations()
        self.shaperLayer.removeAllAnimations()
        self.rotationLayer.isHidden = true;
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
