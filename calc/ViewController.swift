//
//  ViewController.swift
//  calc
//
//  Created by Takumi Muraishi on 2022/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let label = UILabel(frame: CGRect(x:40-10 , y: 150, width:300, height: 100))
    
    let button1 = UIButton(frame: CGRect(x:30 , y: 570, width:70, height: 70))
    let button2 = UIButton(frame: CGRect(x:110 , y: 570, width:70, height: 70))
    let button3 = UIButton(frame: CGRect(x:190 , y: 570, width:70, height: 70))
    let button4 = UIButton(frame: CGRect(x:30 , y: 480, width:70, height: 70))
    let button5 = UIButton(frame: CGRect(x:110  , y: 480, width:70, height: 70))
    let button6 = UIButton(frame: CGRect(x:190 , y: 480, width:70, height: 70))
    let button7 = UIButton(frame: CGRect(x:30 , y: 390, width:70, height: 70))
    let button8 = UIButton(frame: CGRect(x:110  , y: 390, width:70, height: 70))
    let button9 = UIButton(frame: CGRect(x:190 , y: 390, width:70, height: 70))
    let button0 = UIButton(frame: CGRect(x:30 , y: 660, width:145, height: 70))
    
    let buttonAmari = UIButton(frame: CGRect(x:30 , y: 750, width:335, height: 70))
    
    let buttonAc = UIButton(frame: CGRect(x:30 , y: 300, width:70, height: 70))
    let buttonPlusMinus = UIButton(frame: CGRect(x:110  , y: 300, width:70, height: 70))
    let buttonPercent = UIButton(frame: CGRect(x:190 , y: 300, width:70, height: 70))
    
    let buttonDivied = UIButton(frame: CGRect(x:270 , y: 300, width:70, height: 70))
    let buttonMultiple = UIButton(frame: CGRect(x:270 , y: 390, width:70, height: 70))
    let buttonMinus = UIButton(frame: CGRect(x:270 , y: 480, width:70, height: 70))
    let buttonPlus = UIButton(frame: CGRect(x:270 , y: 570, width:70, height: 70))
    
    let buttonDot = UIButton(frame: CGRect(x:190 , y: 660, width:70, height: 70))
    let buttonEqual = UIButton(frame: CGRect(x:270 , y: 660, width:70, height: 70))
    
    var turn = true
    var hugoBox: String?
    var box1: String?
    var box2: String?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        layout()
        numAction()
        hugoAction()
        plusMinusAction()
        dotAction()
        percentAction()
        equalAction()
        acAction()
        
        label.adjustsFontSizeToFitWidth = true
    }
 
 
    @objc func clickNum(_ sender: UIButton) {
        
        let sentText = label.text!
        
        if label.text == "0" {
            label.text = sender.currentTitle!
        }
        else {
            label.text =  sentText + sender.currentTitle!
        }
    }
    
    func numAction() {
        button0.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button1.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button5.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button6.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button7.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button8.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
        button9.addTarget(self, action: #selector(clickNum(_:)), for: .touchUpInside)
    }
    
    @objc func clickHugo(_ sender: UIButton) {
            
            let arrayHugo = [buttonDivied,buttonMultiple,buttonPlus,buttonMinus,buttonAmari]
            hugoBox = sender.currentTitle!
            
            let newArray = arrayHugo.filter { $0.backgroundColor != .orange}
            
            for i in newArray {
                i.backgroundColor = .systemCyan
                i.setTitleColor(.white, for: .normal)
            }
        
            sender.backgroundColor = .white
            sender.setTitleColor(.orange, for: .normal)
            
            box1 = label.text!
            label.text = "0"
            count = 0
        }
    
        func hugoAction() {
            buttonDivied.addTarget(self, action: #selector(clickHugo(_:)), for: .touchUpInside)
            buttonMultiple.addTarget(self, action: #selector(clickHugo(_:)), for: .touchUpInside)
            buttonPlus.addTarget(self, action: #selector(clickHugo(_:)), for: .touchUpInside)
            buttonMinus.addTarget(self, action: #selector(clickHugo(_:)), for: .touchUpInside)
            buttonAmari.addTarget(self, action: #selector(clickHugo(_:)), for: .touchUpInside)
        }
    
    @objc func clickPlusMinus(_ sender: UIButton) {
            
            if (turn) {
                label.text = "-" + label.text!
                turn = false
            }
            else {
                let text = label.text!
                let text_del = text.dropFirst(1)
                label.text = String(text_del)
                turn = true
            }
        }
        func plusMinusAction() {
            buttonPlusMinus.addTarget(self, action: #selector(clickPlusMinus(_:)), for: .touchUpInside)
            
        }
    
    @objc func clickDot(_ sender: UIButton) {
            
            if count < 1 {
                if label.text == "0" {
                    label.text = "0."
                }
                else {
                label.text = label.text! + sender.currentTitle!
                }
            }
            count = count + 1
        }
        
    func dotAction() {
        buttonDot.addTarget(self, action: #selector(clickDot(_:)), for: .touchUpInside)
    }
    
    @objc func clickPercent(_ sender: UIButton) {
            if label.text != "0" {
                let text = label.text!
                let textDouble = Double(text)!
                let textPercent = textDouble / 100
                label.text = String(textPercent)
            }
        }
     
        func percentAction() {
            buttonPercent.addTarget(self, action: #selector(clickPercent(_:)), for: .touchUpInside)
        }
    
    
    
    @objc func clickEqual(_ sender: UIButton) {
     
            box2 = label.text!
            let firstNum : NSDecimalNumber = NSDecimalNumber(string: box1)
            let secondNum : NSDecimalNumber = NSDecimalNumber(string: box2)
            let plainBehavior = NSDecimalNumberHandler(roundingMode: .plain, scale: 0,
                                              raiseOnExactness: false, raiseOnOverflow: false,
                                              raiseOnUnderflow: false,
                                              raiseOnDivideByZero: false)
            
            if hugoBox != "" {
                
                switch hugoBox {
                case "+":
                    let result: NSDecimalNumber = firstNum.adding(secondNum)
                    label.text = ("\(result.stringValue)")
                case "-":
                    let result: NSDecimalNumber = firstNum.subtracting(secondNum)
                    label.text = ("\(result.stringValue)")
                case "×":
                    let result: NSDecimalNumber = firstNum.multiplying(by: secondNum)
                    label.text = ("\(result.stringValue)")
                case "÷":
                    let result: NSDecimalNumber = firstNum.dividing(by:secondNum)
                    label.text = ("\(result.stringValue)")
                case "あまりの計算":
                    let result: NSDecimalNumber = firstNum.dividing(by:secondNum).rounding(accordingToBehavior: plainBehavior)
                    let amari: NSDecimalNumber = firstNum.subtracting(secondNum.multiplying(by: result))
                    label.text = ("商: \(result.stringValue) あまり: \(amari.stringValue)")
                default:
                    break
                }
            }
        }
        
        func equalAction() {
            buttonEqual.addTarget(self, action: #selector(clickEqual(_:)), for: .touchUpInside)
        }
    
    @objc func clickAc(_ sender: UIButton) {
            label.text = "0"
            hugoBox = nil
            count = 0
            let arrayHugo = [buttonDivied, buttonMultiple, buttonPlus, buttonMinus]
            let newArray = arrayHugo.filter { $0.backgroundColor != .orange}
            
            for i in newArray {
                i.backgroundColor = .systemCyan
                i.setTitleColor(.white, for: .normal)
            }
        }
        
        func acAction() {
            buttonAc.addTarget(self, action: #selector(clickAc(_:)), for: .touchUpInside)
        }
    
    
    func layout() {
        view.backgroundColor = .black
        
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 60.0)
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        self.view.addSubview(label)
        
        button1.setTitle("1", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button1.backgroundColor = .darkGray
        button1.layer.cornerRadius = button1.frame.height / 2
        self.view.addSubview(button1)
        
        
        button2.setTitle("2", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button2.backgroundColor = .darkGray
        button2.layer.cornerRadius = button2.frame.height / 2
        self.view.addSubview(button2)
        
        button3.setTitle("3", for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button3.backgroundColor = .darkGray
        button3.layer.cornerRadius = button3.frame.height / 2
        self.view.addSubview(button3)
        
        button4.setTitle("4", for: .normal)
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button4.backgroundColor = .darkGray
        button4.layer.cornerRadius = button4.frame.height / 2
        self.view.addSubview(button4)
        
        button5.setTitle("5", for: .normal)
        button5.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button5.backgroundColor = .darkGray
        button5.layer.cornerRadius = button5.frame.height / 2
        self.view.addSubview(button5)
        
        button6.setTitle("6", for: .normal)
        button6.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button6.backgroundColor = .darkGray
        button6.layer.cornerRadius = button6.frame.height / 2
        self.view.addSubview(button6)
        
        button7.setTitle("7", for: .normal)
        button7.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button7.backgroundColor = .darkGray
        button7.layer.cornerRadius = button7.frame.height / 2
        self.view.addSubview(button7)
        
        button8.setTitle("8", for: .normal)
        button8.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button8.backgroundColor = .darkGray
        button8.layer.cornerRadius = button8.frame.height / 2
        self.view.addSubview(button8)
        
        button9.setTitle("9", for: .normal)
        button9.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button9.backgroundColor = .darkGray
        button9.layer.cornerRadius = button9.frame.height / 2
        self.view.addSubview(button9)
        
        button0.setTitle("0", for: .normal)
        button0.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        button0.backgroundColor = .darkGray
        button0.layer.cornerRadius = button0.frame.height / 2
        self.view.addSubview(button0)
        
        buttonAmari.setTitle("あまりの計算", for: .normal)
        buttonAmari.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonAmari.backgroundColor = .systemCyan
        buttonAmari.layer.cornerRadius = buttonAmari.frame.height / 2
        self.view.addSubview(buttonAmari)
        
        buttonDivied.setTitle("÷", for: .normal)
        buttonDivied.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonDivied.backgroundColor = .systemCyan
        buttonDivied.layer.cornerRadius = buttonDivied.frame.height / 2
        self.view.addSubview(buttonDivied)
        
        buttonMultiple.setTitle("×", for: .normal)
        buttonMultiple.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonMultiple.backgroundColor = .systemCyan
        buttonMultiple.layer.cornerRadius = buttonMultiple.frame.height / 2
        self.view.addSubview(buttonMultiple)
        
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonPlus.backgroundColor = .systemCyan
        buttonPlus.layer.cornerRadius = buttonPlus.frame.height / 2
        self.view.addSubview(buttonPlus)
        
        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonMinus.backgroundColor = .systemCyan
        buttonMinus.layer.cornerRadius = buttonMinus.frame.height / 2
        self.view.addSubview(buttonMinus)
        
        buttonDot.setTitle(".", for: .normal)
        buttonDot.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonDot.backgroundColor = .darkGray
        buttonDot.layer.cornerRadius = buttonDot.frame.height / 2
        self.view.addSubview(buttonDot)
        
        buttonEqual.setTitle("=", for: .normal)
        buttonEqual.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonEqual.backgroundColor = .systemCyan
        buttonEqual.layer.cornerRadius = buttonEqual.frame.height / 2
        self.view.addSubview(buttonEqual)
        
        buttonAc.setTitle("AC", for: .normal)
        buttonAc.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonAc.backgroundColor = .lightGray
        buttonAc.setTitleColor(.black, for: .normal)
        buttonAc.layer.cornerRadius = buttonAc.frame.height / 2
        self.view.addSubview(buttonAc)
        
        buttonPlusMinus.setTitle("+/-", for: .normal)
        buttonPlusMinus.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonPlusMinus.backgroundColor = .lightGray
        buttonPlusMinus.setTitleColor(.black, for: .normal)
        buttonPlusMinus.layer.cornerRadius = buttonPlusMinus.frame.height / 2
        self.view.addSubview(buttonPlusMinus)
        
        buttonPercent.setTitle("%", for: .normal)
        buttonPercent.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        buttonPercent.backgroundColor = .lightGray
        buttonPercent.setTitleColor(.black, for: .normal)
        buttonPercent.layer.cornerRadius = buttonPercent.frame.height / 2
        self.view.addSubview(buttonPercent)
    }

    
}
