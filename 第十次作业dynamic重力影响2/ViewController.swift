//
//  ViewController.swift
//  第十次作业dynamic重力影响2
//
//  Created by student on 2018/12/1.
//  Copyright © 2018年 molinjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var animator =  UIDynamicAnimator(referenceView: self.backView)
    
    @IBOutlet weak var backView: UIView!
    let gravity = UIGravityBehavior()
    let collsion = UICollisionBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator.addBehavior(gravity)
        animator.addBehavior(collsion)
   collsion.translatesReferenceBoundsIntoBoundary = true
    }

    @IBAction func addView(_ sender: Any) {
        let width = Int(backView.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let label = UILabel(frame:CGRect(x: randx,y: 0,width: width,height: width))
        label.backgroundColor = UIColor.red
        label.text = "A"
        label.textAlignment = .center
        backView.addSubview(label)
        
        gravity.addItem(label)
        collsion.addItem(label)
    }
    
    @IBAction func Up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    
    @IBAction func Down(_ sender: Any) {
         gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func Left(_ sender: Any) {
         gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func Right(_ sender: Any) {
         gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    
    @IBAction func deleteall(_ sender: Any) {
        
        for item in self.backView.subviews{
            if item is UILabel{
                item.removeFromSuperview()
                gravity.removeItem(item)
                collsion.removeItem(item)
            }
        }
    }
    
}

