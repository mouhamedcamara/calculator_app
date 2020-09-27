//
//  ViewController.swift
//  calculator_app
//
//  Created by Mouhamed Camara on 9/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    //MARK: Outlets
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    //MARK: Actions
    @IBAction func clearButtonAct(_ sender: UIButton)
    {
        inputTextField.text?.removeAll()
        inputNumber2 = 0
        inputNumber1 = 0
        operationChosen = .addition
        outputLabel.text = "Réponse"
    }
    
    @IBAction func addButtonAct(_ sender: UIButton)
    {
        tag = 0
        operationChosen = .addition
        storeFirstInputValue()
    }
    
    @IBAction func soustractButtonAct(_ sender: UIButton)
    {
        tag = 0
        operationChosen = .substraction
        storeFirstInputValue()
    }
    
    @IBAction func multiButtonAct(_ sender: UIButton)
    {
        tag = 0
        operationChosen = .multiplication
        storeFirstInputValue()
    }
    
    @IBAction func dividButtonAct(_ sender: UIButton)
    {
        tag = 0
        operationChosen = .division
        storeFirstInputValue()
    }
    
    @IBAction func operatingButtonAct(_ sender: UIButton)
    {
        tag = 1
        storeFirstInputValue()
        calculatingAnswer()
    }
    
    //MARK: Properties
    
    var inputNumber1: Double!
    
    var inputNumber2: Double!
    
    var tag = 0
    
    var operationChosen: Operation = Operation.addition
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Private Function
    
    private func storeFirstInputValue()
    {
        guard let inputText = inputTextField.text else
        {
            print("Invalid Input")
            return
        }
        
        if tag == 0
        {
            inputNumber1 = Double(inputText)!
        }
        else
        {
            inputNumber2 = Double(inputText)!
        }
        
        inputTextField.text?.removeAll()
        
    }
    
    private func calculatingAnswer()
    {
        var answer = Double()
        
        guard let input1 = inputNumber1 else {
            return
        }
        
        guard let input2 = inputNumber2 else {
            return
        }
        
        switch operationChosen
        {
            case .addition:
                answer = input1 + input2
            case .substraction:
                answer = input1 - input2
            case .multiplication:
                answer = input1 * input2
            case .division:
                answer = input1 / input2
        }
        
        outputLabel.text = String(answer)
    }
    
    
    //MARK: Enum
    
    enum Operation
    {
        case addition
        case substraction
        case multiplication
        case division
    }

}

