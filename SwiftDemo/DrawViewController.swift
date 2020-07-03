//
//  DrawViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2020/5/8.
//  Copyright © 2020 Shiguanghui. All rights reserved.
//

import UIKit

import SnapKit

class ListNode {
    var val:Int
    var next:ListNode?
    var prev :ListNode?
    init(x:Int) {
        self.val = x;
    }
}

class DrawViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
      
        let head = ListNode(x: 0)
        let  head1 = ListNode(x:1)
        head.next = head1;
        let head2 = ListNode(x: 2)
        head1.next = head2;
        let head3 = ListNode(x: 3);
        head2.next = head3;
        let next = resversNode(head: head);
        print(next.next);
        
        
        
        
        
        
        
//        print(drawImage())
//
//        let image = drawImage()
//
//        let imageV = UIImageView(frame: CGRect.zero)
//        imageV.image = image
//        self.view.addSubview(imageV)
//
//        imageV.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
        // Do any additional setup after loading the view.
    }
    
    func resversNode(head:ListNode)->ListNode{
        if head.next == nil {return head}
        
        var pre:ListNode?
        var cur = head.next
        var next = cur?.next
        while (next != nil) {
            print(next?.val);
            cur?.next = pre;
            pre = cur;
            cur = next;
            next = cur?.next;
        }
        return cur!;
    }
    
    func insertList(node:ListNode) -> ListNode {
        if head == nil { return nil }
    };
    
    
    
    func drawImage()-> UIImage {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, UIScreen.main.scale)
        
        let ctx = UIGraphicsGetCurrentContext()!
        
        ctx.setStrokeColor(UIColor.cyan.cgColor)
        ctx.setLineWidth(10.0)
        
        ctx.addArc(center: CGPoint(x: width/2.0, y: height/2.0), radius: 100, startAngle: 0, endAngle: CGFloat( 2*Double.pi), clockwise: true)
        
        ctx.addLine(to: CGPoint(x: width/2 + 150, y: height/2 ))
        let path = UIBezierPath(roundedRect: CGRect(x: width/2 - 150, y: height/2 - 150, width: 300, height: 300),  cornerRadius:10.0)
        ctx.addPath(path.cgPath)
        ctx.closePath()
        ctx.setFillColor(UIColor.cyan.cgColor)
        ctx.drawPath(using: CGPathDrawingMode.fill)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
