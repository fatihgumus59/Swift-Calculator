//
//  ViewController.swift
//  HesapMakinesi
//
//  Created by Fatih Gümüş on 17.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber : String = ""
    var secondNumber : String = ""
    var operations : String = ""
    var result : String = ""
    var haveResult : Bool = false
    var numberAfterResult : String = ""

    @IBOutlet weak var numberScreen: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func add(_ sender: UIButton) {
        operations = "+"
    }
    @IBAction func subtract(_ sender: UIButton) {
        operations = "-"
    }
    @IBAction func multiply(_ sender: UIButton) {
        operations = "x"
    }
    
    @IBAction func divide(_ sender: UIButton) {
        operations = "/"
    }
    @IBAction func equals(_ sender: UIButton) {
        result = String(doOperation())
        
        // tam sayılarda sonda 0 yazmaması için . dan sonra 0 varsa sildik.
        let numArray = result.components(separatedBy: ".") //16.0
        if numArray[1] == "0"{//ikinci elaman 0 ise sadece ilk elamanı döndürmesini istedik
            numberScreen.text = numArray[0]
        }else{
            numberScreen.text = result
        }
        
        numberAfterResult = ""
    }
    
    
    @IBAction func numberPress(_ sender: UIButton) {
        if operations == "" {
            firstNumber += String(sender.tag)
            numberScreen.text = firstNumber
        }else if operations != "" && !haveResult{
            secondNumber += String(sender.tag)
            numberScreen.text = secondNumber
        }else if operations != "" && haveResult{
            numberAfterResult += String(sender.tag)
            numberScreen.text = numberAfterResult
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        firstNumber = ""
        secondNumber  = ""
        operations  = ""
        result  = ""
        haveResult  = false
        numberAfterResult = ""
        numberScreen.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        for button in buttons{
            // tüm butonlara radius değeri atayarak yuvarlak hale getirik
            button.layer.cornerRadius = button.frame.size.height / 2
            
            // tüm butonların fotunu 24 yaptık
            button.titleLabel?.font = UIFont(name: "System", size: 24)
        }
    }
    
    func doOperation() -> Double {
        if operations == "+" {
            if !haveResult{
                haveResult = true
                return Double(firstNumber)! + Double(secondNumber)!
            }
            else{
                return Double(result)! + Double(numberAfterResult)!
            }
        }
        else if operations == "-" {
            if !haveResult{
                haveResult = true
                return Double(firstNumber)! - Double(secondNumber)!
            }
            else{
                return Double(result)! - Double(numberAfterResult)!
            }
        }
        else if operations == "/" {
            if !haveResult{
                haveResult = true
                return Double(firstNumber)! / Double(secondNumber)!
            }
            else{
                return Double(result)! / Double(numberAfterResult)!
            }
        }
        else if operations == "x" {
            if !haveResult{
                haveResult = true
                return Double(firstNumber)! * Double(secondNumber)!
            }
            else{
                return Double(result)! * Double(numberAfterResult)!
            }
        }
        return 0
    }


}

