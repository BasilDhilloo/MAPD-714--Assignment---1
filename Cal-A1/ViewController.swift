//
//  ViewController.swift
//  Cal-A1
//
//  Created by Basil Farooq on 2021-10-03.
//


// GUI Calculator + Functional Logic - Assignment 2
// Basil Farooq
// 301201128
// Due Date: 3rd October
// GUI of Calculator
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CalculatorWorkings: UILabel!
    @IBOutlet weak var CalculatorResult: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
    
    func clearAll()
    {
        workings = ""
        CalculatorWorkings.text = ""
        CalculatorResult.text = ""
    }
    
    
    @IBAction func allClearTab(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTab(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            CalculatorWorkings.text = workings
        }
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        CalculatorWorkings.text = workings
    }
    
    func plusMinusWorking(value: String){
        workings =  value + workings
        CalculatorWorkings.text = workings
    }
    
    @IBAction func plusMinusChange(_ sender: Any) {
        if(CalculatorWorkings.text?.prefix(1) == "-"){
            workings.removeFirst()
            CalculatorWorkings.text = workings
            plusMinusWorking(value: "+")
        }
        
        if(CalculatorWorkings.text?.prefix(1) == "+"){
            workings.removeFirst()
            CalculatorWorkings.text = workings
            plusMinusWorking(value: "-")
        }
    }
    
    @IBAction func divideFunc(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func multiplyFunc(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func subtractFunc(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func addFunc(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
  
// Equal Function
    @IBAction func equalFunc(_ sender: Any) {
        if(validInput()){
            let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            CalculatorResult.text = resultString
        }
        else{
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Math Error",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes{
            if(index == 0){
                return false
            }
            
            if(index == workings.count - 1){
                return false
            }
            
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    
    func specialCharacter(char : Character) -> Bool {
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "-"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.8f", result)
        }
        else{
            return String(format: "%.8f", result)
        }
    }
    
    @IBAction func modulusFunc(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func decimalFunc(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroFunc(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneFunc(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoFunc(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeFunc(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourFunc(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveFunc(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixFunc(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenFunc(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightFunc(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineFunc(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

