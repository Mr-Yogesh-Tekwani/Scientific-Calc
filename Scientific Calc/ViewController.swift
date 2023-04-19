//
//  ViewController.swift
//  Scientific Calc
//
//  Created by Yogesh Tekwani on 4/18/23.
//

import UIKit

enum Operations{
    case add
    case divide
    case sub
    case multiply
}

class ViewController: UIViewController {
    
    var savedOperation : Operations?
    var storedButtonValue = 0
    var operationPressed: Bool = false
    
    let mainn:UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .vertical
        mainstack.alignment = .fill
        mainstack.distribution = .fill
        //mainstack.spacing = 1
        //mainstack.translatesAutoresizingMaskIntoConstraints = false
        return mainstack
    }()
    
    let mainViewStack:UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fill
        mainstack.spacing = 1
        mainstack.translatesAutoresizingMaskIntoConstraints = false
        return mainstack
    }()
    
    let mainStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .vertical
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        mainstack.translatesAutoresizingMaskIntoConstraints = false
        return mainstack
    }()
    
    let firstStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        return mainstack
    }()
    
    let secondStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        return mainstack
    }()
    
    let thirdStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        
        return mainstack
    }()
    
    let fourthStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        
        return mainstack
    }()
    
    let fifthStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        mainstack.axis = .horizontal
        
        return mainstack
    }()
    
    
    // Scientific Calc Stack:
    
    let scmainStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .vertical
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        mainstack.translatesAutoresizingMaskIntoConstraints = false
        return mainstack
    }()
    
    let scfirstStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        return mainstack
    }()
    
    let scsecondStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        return mainstack
    }()
    
    let scthirdStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        
        return mainstack
    }()
    
    let scfourthStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        
        return mainstack
    }()
    
    let scfifthStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        mainstack.axis = .horizontal
        
        return mainstack
    }()
    
    
    let label : UILabel = {
        let l = UILabel()
        l.text = "0"
        l.backgroundColor = .black
        l.textAlignment = .right
        l.textColor = .white
        l.font = l.font.withSize(50)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        // Scientific Calc Buttons
        scfirstStackView.addArrangedSubview(createButton(title: "(", color: .gray))
        scfirstStackView.addArrangedSubview(createButton(title: ")", color: .gray))
        scfirstStackView.addArrangedSubview(createButton(title: "mc", color: .gray))
        scfirstStackView.addArrangedSubview(createButton(title: "m+", color: .gray))
        scfirstStackView.addArrangedSubview(createButton(title: "m-", color: .gray))
        scfirstStackView.addArrangedSubview(createButton(title: "mr", color: .gray))
        
        scmainStackView.addArrangedSubview(scfirstStackView)
        
        // Normal Calc Buttons
        firstStackView.addArrangedSubview(createButton(title: "%", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "+/-", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "AC", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "÷", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(firstStackView)
        
        
        // Scientific Calc Buttons
        scsecondStackView.addArrangedSubview(createButton(title: "2nd", color: .gray))
        scsecondStackView.addArrangedSubview(createButton(title: "x2", color: .gray))
        scsecondStackView.addArrangedSubview(createButton(title: "x3", color: .gray))
        scsecondStackView.addArrangedSubview(createButton(title: "xy", color: .gray))
        scsecondStackView.addArrangedSubview(createButton(title: "ex", color: .gray))
        scsecondStackView.addArrangedSubview(createButton(title: "10x", color: .gray))
        
        scmainStackView.addArrangedSubview(scsecondStackView)
        
        // Normal Calc Buttons
        
        secondStackView.addArrangedSubview(createButton(title: "7"))
        secondStackView.addArrangedSubview(createButton(title: "8"))
        secondStackView.addArrangedSubview(createButton(title: "9"))
        secondStackView.addArrangedSubview(createButton(title: "X", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(secondStackView)
        
        
        // Scientific Calc Buttons
        scthirdStackView.addArrangedSubview(createButton(title: "1/x", color: .gray))
        scthirdStackView.addArrangedSubview(createButton(title: "1/2x", color: .gray))
        scthirdStackView.addArrangedSubview(createButton(title: "1/3x", color: .gray))
        scthirdStackView.addArrangedSubview(createButton(title: "1/xy", color: .gray))
        scthirdStackView.addArrangedSubview(createButton(title: "ln", color: .gray))
        scthirdStackView.addArrangedSubview(createButton(title: "log 10", color: .gray))
        
        scmainStackView.addArrangedSubview(scthirdStackView)
        
        // Normal Calc Buttons
        thirdStackView.addArrangedSubview(createButton(title: "4"))
        thirdStackView.addArrangedSubview(createButton(title: "5"))
        thirdStackView.addArrangedSubview(createButton(title: "6"))
        thirdStackView.addArrangedSubview(createButton(title: "-", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(thirdStackView)
        
        
        // Scientific Calc Buttons
        scfourthStackView.addArrangedSubview(createButton(title: "x!", color: .gray))
        scfourthStackView.addArrangedSubview(createButton(title: "sin", color: .gray))
        scfourthStackView.addArrangedSubview(createButton(title: "cos", color: .gray))
        scfourthStackView.addArrangedSubview(createButton(title: "tan", color: .gray))
        scfourthStackView.addArrangedSubview(createButton(title: "e", color: .gray))
        scfourthStackView.addArrangedSubview(createButton(title: "EE", color: .gray))
        
        scmainStackView.addArrangedSubview(scfourthStackView)
        
        // Normal Calc Buttons
        fourthStackView.addArrangedSubview(createButton(title: "1"))
        fourthStackView.addArrangedSubview(createButton(title: "2"))
        fourthStackView.addArrangedSubview(createButton(title: "3"))
        fourthStackView.addArrangedSubview(createButton(title: "+", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(fourthStackView)
        
        let tempStack = UIStackView()
        tempStack.axis = .horizontal
        tempStack.alignment = .fill
        tempStack.distribution = .fillEqually
        tempStack.addArrangedSubview(createButton(title: "."))
        tempStack.addArrangedSubview(createButton(title: "=", color: .orange, action: #selector(operationAction)))
        
        
        
        // Scientific Calc Buttons
        scfifthStackView.addArrangedSubview(createButton(title: "Rad", color: .gray))
        scfifthStackView.addArrangedSubview(createButton(title: "sinh", color: .gray))
        scfifthStackView.addArrangedSubview(createButton(title: "cosh", color: .gray))
        scfifthStackView.addArrangedSubview(createButton(title: "tanh", color: .gray))
        scfifthStackView.addArrangedSubview(createButton(title: "pi", color: .gray))
        scfifthStackView.addArrangedSubview(createButton(title: "Rand", color: .gray))
        
        scmainStackView.addArrangedSubview(scfifthStackView)
        
        // Normal Calc Buttons
        fifthStackView.addArrangedSubview(createButton(title: "0"))
        fifthStackView.addArrangedSubview(tempStack)
        
        mainStackView.addArrangedSubview(fifthStackView)
        
        // Constraints
        
            mainViewStack.addArrangedSubview(scmainStackView)
            mainViewStack.addArrangedSubview(mainStackView)
            mainn.addArrangedSubview(label)
            mainn.addArrangedSubview(mainViewStack)
            self.view.addSubview(mainn)
        
        if UIDevice.current.orientation.isPortrait{
            scmainStackView.isHidden = true
        }
        else if UIDevice.current.orientation.isLandscape{
            scmainStackView.isHidden = false
        }
        
        
        mainn.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainn.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainn.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            mainn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
    }

    func createButton(title:String,
                      color:UIColor = .blue,
                      action: Selector = #selector(numPadAction)) -> UIButton{
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 33)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    
    @objc func numPadAction(_ sender: UIButton){
        
        if operationPressed{
            operationPressed = false
            label.text = "0"
        }
        
        let prevVal = label.text == "0" ? "" : (label.text ?? "")
        label.text = prevVal + (sender.titleLabel?.text ?? "")
        
    }
    
    
    
    @objc func operationAction(_ sender: UIButton){
        guard let text = sender.titleLabel?.text,
              let firstValueString = label.text,
              let firstValueInt = Int(firstValueString)
        
        else{return}
        
        switch text{
        case "+":
            savedOperation = .add
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "-":
            savedOperation = .sub
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "X":
            savedOperation = .multiply
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "÷":
            savedOperation = .divide
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "+/-":
            label.text = String(firstValueInt * -1)
            
        case "%":
            label.text = String(firstValueInt * 1/100)
            
            
        case "AC":
            label.text = "0"
            
        case "=":
            handleResult(secondValueInt: firstValueInt, firstValueInt: storedButtonValue)
            
        default:
            return
        }
        operationPressed = true
    }
    
    
    func handleResult(secondValueInt: Int,firstValueInt : Int){
    guard let savedOperation = savedOperation else {return}
    
        switch savedOperation {
        case .add:
            label.text = String(describing: firstValueInt+secondValueInt)
        case .divide:
            label.text = String(describing: firstValueInt/secondValueInt)
        case .sub:
            label.text = String(describing: firstValueInt-secondValueInt)
        case .multiply:
            label.text = String(describing: firstValueInt*secondValueInt)
        }
        
        print(firstValueInt)
        print(savedOperation)
        print(secondValueInt)
    
        storedButtonValue = 0
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isPortrait{
            scmainStackView.isHidden = true
        }
        else if UIDevice.current.orientation.isLandscape{
            scmainStackView.isHidden = false
            }
    }
    
}
