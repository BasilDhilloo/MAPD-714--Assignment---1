//
//  ViewController.swift
//  Assignment 1 + 2
//
//  Created by Basil Farooq on 2021-10-03.
//


// GUI Calculator + Functional Logic - Assignment 2
// Basil Farooq
// 301201128
// Due Date: 3rd October
// GUI of Calculator with Complete logic
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
    
    
// Clear All Function will clear all the calculations
    func clearAll()
    {
        workings = ""
        CalculatorWorkings.text = ""
        CalculatorResult.text = ""
    }
    
// Clear Tab Action will clear all the calculations
    @IBAction func allClearTab(_ sender: Any) {
        clearAll()
    }
    
// This function will delete the last instance/digit
    @IBAction func backTab(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            CalculatorWorkings.text = workings
        }
    }
    
// This function is used to handle the calculations
    func addToWorkings(value: String){
        workings = workings + value
        CalculatorWorkings.text = workings
    }
    
// This function is used to swap plus and minus sign with the results
    func plusMinusWorking(value: String){
        workings =  value + workings
        CalculatorWorkings.text = workings
    }
    
// This function is used to handle the plus minus action and swap the operator
    @IBAction func plusMinusChange(_ sender: Any) {
        if(CalculatorWorkings.text?.prefix(1) == "+"){
            workings.removeFirst()
            CalculatorWorkings.text = workings
            plusMinusWorking(value: "-")
        }
        
        else if(CalculatorWorkings.text?.prefix(1) == "-"){
            workings.removeFirst()
            CalculatorWorkings.text = workings
            plusMinusWorking(value: "+")
        }
        
        else {
            CalculatorWorkings.text = workings
        }
        
        
        
    }
    
//This action function is used to pass the divide operator to workings function
    @IBAction func divideFunc(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
//This action function is used to pass the multiply operator to workings function
    @IBAction func multiplyFunc(_ sender: Any) {
        addToWorkings(value: "*")
    }

//This action function is used to pass the minus operator to workings function
    @IBAction func subtractFunc(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
//This action function is used to pass the plus operator to workings function
    @IBAction func addFunc(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
  
// Equal Function validating and handling the expression
    @IBAction func equalFunc(_ sender: Any) {
        if(validInput()){
            let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            CalculatorResult.text = resultString
        }
        
        // Checking maths error
        else{
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Math Error",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
// This function is used for validation
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
    
//This action function is used to check the operators and return true otherwise gives error
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
    
//This action function is used to pass the modulus operator to workings function
    @IBAction func modulusFunc(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    //This action function is used to pass the decimal string to workings function
    @IBAction func decimalFunc(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    //This action function is used to pass the zero digit string to workings function
    @IBAction func zeroFunc(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    //This action function is used to pass the one digit string to workings function
    @IBAction func oneFunc(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    //This action function is used to pass the two digit string to workings function
    @IBAction func twoFunc(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    //This action function is used to pass the three digit string to workings function
    @IBAction func threeFunc(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    //This action function is used to pass the four digit string to workings function
    @IBAction func fourFunc(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    //This action function is used to pass the five digit string to workings function
    @IBAction func fiveFunc(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    //This action function is used to pass the six digit string to workings function
    @IBAction func sixFunc(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    //This action function is used to pass the seven digit string to workings function
    @IBAction func sevenFunc(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    //This action function is used to pass the eigth digit string to workings function
    @IBAction func eightFunc(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    //This action function is used to pass the nine digit string to workings function
    @IBAction func nineFunc(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

