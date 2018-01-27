//
//  ViewController2.swift
//  calculater
//
//  Created by Stepan on 1/23/18.
//  Copyright © 2018 Stepan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var backroundMaskView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var firstView: UIView!
    var animator:UIDynamicAnimator!
    var attachmentBahavior:UIAttachmentBehavior!
    var snapBehavior:UISnapBehavior!
    
    var a:String = ""
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let translate = CGAffineTransform(translationX: 0, y: 300)
        bottomView.transform = translate.concatenating(scale)
       
//        let scale1 = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        let translate1 = CGAffineTransform(translationX: 0, y: 300)
//        userView.transform = translate.concatenating(scale)
        
    
//
//        dialogView.transform = CGAffineTransform.identity
//        dialogView.transform = CGAffineTransform(scaleX: 2, y: 2)
//        dialogView.transform = CGAffineTransform(translationX: -256, y: -256)
//        dialogView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//        dialogView.transform = CGAffineTransform.identity
    
        UIView.animate(withDuration: 2) { () -> Void in
           let scale = CGAffineTransform(scaleX: 1 , y: 1)
           let translate = CGAffineTransform(translationX: 0, y: 0)
          self.bottomView.transform = translate.concatenating(scale)
            
        }
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set blur effecct
        addBlurEffect(view: backroundMaskView, effect: UIBlurEffectStyle.dark)
        addBlurEffect(view: headerView, effect: UIBlurEffectStyle.dark)
        addBlurEffect(view: bottomView, effect: UIBlurEffectStyle.dark)
    
        
        animator = UIDynamicAnimator(referenceView: view)
        snapBehavior = UISnapBehavior(item: firstView, snapTo: view.center)
        
  }


    @IBAction func handleGestureRecognizer(sender: AnyObject) {
       let  myView = firstView
        let location = sender.location(in: view)
      
        let boxLocation = sender.location(in: firstView)
        
        
        if sender.state == UIGestureRecognizerState.began{
      
       //     animator.removeBehavior(snapBehavior)
            
//            let centerOffset = UIOffsetMake(15,150)
//
//            attachmentBahavior = UIAttachmentBehavior(item: myView!, offsetFromCenter: centerOffset, attachedToAnchor: location)
//            attachmentBahavior.frequency = 0
//            animator.addBehavior(attachmentBahavior)
            firstView.center = location
//            print("began "+"\(location)")
//            UIView.animate(withDuration: 1
//                , animations: {
//                    let scale = CGAffineTransform(scaleX: 1 , y: 1)
//                    let translate = CGAffineTransform(translationX: 0, y: 0)
//                    self.userView.transform = translate.concatenating(scale)
//            })
            
            UIView.animate(withDuration: 1
                , animations: {
                    self.userView.frame = CGRect(x: 65, y: 590, width: 206, height: 47)
            })
//
//            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
//                self.view.layoutIfNeeded()
//            }) { (animationComplete) in
//                print("The animation is complete!")
//            }
            
            //            UIView.animate(withDuration: 2) { () -> Void in
//                let scale = CGAffineTransform(scaleX: 1 , y: 1)
//                let translate = CGAffineTransform(translationX: 0, y: 0)
//                self.userView.transform = translate.concatenating(scale)
//
//            }
        }else if sender.state == UIGestureRecognizerState.changed {
       //     attachmentBahavior.anchorPoint = location
              firstView.center = location
//            print("changed "+"\(location)")
        }
        else if  sender.state == UIGestureRecognizerState.ended {
//            firstView.isHidden = true
//            print("end"+"\(location)")
            
         // animator.removeBehavior(attachmentBahavior)
            snapBehavior = UISnapBehavior(item: myView!, snapTo: view.center)
            animator.addBehavior(snapBehavior)
            
        }
    
    }
    
  
    
    
   
    func addBlurEffect(view :UIView,effect:UIBlurEffectStyle)
    {
        view.backgroundColor = UIColor.clear
        
        let blurEffect = UIBlurEffect(style: effect)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame =  view.bounds
        view.insertSubview(blurEffectView , at: 0)
        
        
    }
    


    
}
