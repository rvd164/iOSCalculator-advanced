//
//  ViewController.swift
//  calculater
//
//  Created by Stepan on 1/18/18.
//  Copyright © 2018 Stepan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayresultlabel: UILabel!
    //
    @IBOutlet weak var currentTextTyping: UITextView!
    //
    var stillTyping = false
    var firstOperator:Double = 0
    var secondOperator:Double = 0
    var singOperator:String = ""
    var doDotButon = false
//
//
//
//
    //
    override var prefersStatusBarHidden: Bool {
        return true
    }
//
//
//
    var currentInput:Double {
        get {return Double(displayresultlabel.text!)!

        }
//
        set {
            let value = "\(newValue)"
            let valurArray = value.components(separatedBy: ".")
            if valurArray[1] == "0" {
               displayresultlabel.text = valurArray[0]
            }else{
               displayresultlabel.text = "\(newValue)"
            }

            stillTyping = false
        }
    }
//
    @IBAction func numberPressed(_ sender: UIButton) {
       let number  = sender.currentTitle
       
        currentTextTyping.text! =  currentTextTyping.text.characters +  number!
       
        if stillTyping {
            if (displayresultlabel.text?.characters.count)! < 20 {
                displayresultlabel.text = displayresultlabel.text! + number!
        }

       }
      else {
            displayresultlabel.text = number!
            stillTyping = true
            }


    }
//
    @IBAction func twoOperaindsSingPressed(_ sender: UIButton) {
   
       // currentTextTyping.text! =  sender.currentTitle! + currentTextTyping.text.characters
     
        firstOperator = currentInput
        stillTyping = false;
        singOperator = sender.currentTitle!
        doDotButon = false
   }
//
//
//
    @IBAction func tipingCurve(_ sender: UIButton) {
    currentTextTyping.text = currentTextTyping.text + sender.currentTitle!
        
    }
   
    @IBAction func singOperator(_ sender: UIButton) {
        if stillTyping {
        secondOperator = currentInput

        }
        
  //      currentTextTyping.text = currentTextTyping.text + sender.currentTitle!
        math()
    }
//
    func math()
    {
        switch singOperator {
        case "-":
            currentInput = firstOperator - secondOperator
        case "+":
            currentInput = firstOperator + secondOperator
        case "×":
            currentInput = firstOperator * secondOperator
        case "÷":
            currentInput = firstOperator / secondOperator
        default:
            break
        }
    
        
    }
//
//
//
    @IBAction func clearButton(_ sender: UIButton) {
    firstOperator = 0
        secondOperator = 0
        currentInput = 0
        displayresultlabel.text = "0"
        stillTyping = false
        doDotButon = false
        currentTextTyping.text = ""
////    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
////                            self.view.layoutIfNeeded()
////                        }) { (animationComplete) in
////                            print("The animation is complete!")
////                        }
////
   }
//
    @IBAction func plusMinusButton(_ sender: UIButton) {
        if currentInput != 0 {
        currentInput = -currentInput
        }

    }
//
//
    @IBAction func pecentButton(_ sender: UIButton) {
        if currentInput != 0 {
            currentInput = currentInput/100
        }
    }
//
    @IBAction func squreButton(_ sender: UIButton) {
    currentInput = sqrt(currentInput)
    }
//
    @IBAction func dotButton(_ sender: UIButton)
    {
        if !doDotButon {
            displayresultlabel.text = displayresultlabel.text! + "."
            doDotButon = true;
            stillTyping = true
        }
    }
//
    @IBAction func removingButton(_ sender: UIButton) {
        if currentInput != 0 {
        displayresultlabel.text!.remove(at: displayresultlabel.text!.characters.index(before: displayresultlabel.text!.characters.endIndex))
    if displayresultlabel.text! == "" {
            currentInput = 0
        }

            var display = displayresultlabel.text!

     if display[display.index(before:display.characters.endIndex)] == "." {
         displayresultlabel.text!.remove(at: displayresultlabel.text!.characters.index(before: displayresultlabel.text!.characters.endIndex))
       }

  }
   }
    
    
}

