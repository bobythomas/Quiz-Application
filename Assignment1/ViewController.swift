//
//  ViewController.swift
//  Assignment1
//
//  Created by boby thomas on 2015-06-14.
//  Copyright (c) 2015 boby thomas. All rights reserved.
//

import UIKit

var answeredArray : [Bool] = [false,false,false,false,false]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    let quizCellIdentifieer = "quizCell"
    @IBOutlet weak var tableView: UITableView!
    var QADirectory : [String : [String]]!
    var Questions : [String]!
    var ResultString : [String] = [ "Please try Again" ,
                                    "Good Job",
                                    "Excellent work!",
                                    "You are a genius!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //register cell class
        tableView.registerClass(QuizQuestionCell.self,
            forCellReuseIdentifier: quizCellIdentifieer)
        
        let newNib = UINib(nibName: "QuizQuestionCell", bundle: nil)
        tableView.registerNib(newNib, forCellReuseIdentifier: quizCellIdentifieer)
        
        let path = NSBundle.mainBundle().pathForResource("QuestionAndAnswers", ofType: "plist")
        let nsDic = NSDictionary(contentsOfFile: path!)
        QADirectory = nsDic as! [String : [String]]
        Questions = nsDic?.allKeys as! [String]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCellWithIdentifier(quizCellIdentifieer, forIndexPath: indexPath) as! QuizQuestionCell
        fillTableCellData(newCell, rndQuestion: Int(arc4random_uniform(10)), cellID : indexPath.row)
        
        return newCell
    }
    
    func fillTableCellData(newCell : QuizQuestionCell, rndQuestion : Int, cellID : Int)
    {
        newCell.cellID = cellID
        newCell.viewControllerRef = self
        newCell.QuestionHeading.text = String("Question \(cellID+1)")
        newCell.Question.text = Questions[rndQuestion]
        //newCell.questionStr = Questions[rndQuestion]
        var answers = QADirectory[Questions[rndQuestion]]! as [String]
        
        newCell.checkBox1Label.text = answers[0]
        newCell.checkBox2Label.text = answers[1]
        newCell.checkBox3Label.text = answers[2]
        newCell.checkBox4Label.text = answers[3]
        newCell.answerForQ = answers[4]

    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    func clearAndReTest()
    {
        answeredArray = [false,false,false,false,false]
        for var loopindex = 0; loopindex < 5 ; loopindex++
        {
            let qCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: loopindex, inSection: 0)) as! QuizQuestionCell
            qCell.clearCell()
            fillTableCellData(qCell, rndQuestion : Int(arc4random_uniform(10)), cellID : loopindex)
        }
        
    }
    
    func checkIfQuizComplete()
    {
        var bDone : Bool = true
        for value in answeredArray
        {
            if value == false
            {
                bDone = false
                break
            }
        }
       
        if bDone == true{
           showResult()
        }
    }
    
    func showResult()
    {
        var correctAns : Int = 0
        
        for var loopindex = 0; loopindex < 5 ; loopindex++
        {
            let qCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: loopindex, inSection: 0)) as! QuizQuestionCell
            if qCell.isAnsCorrect() == true
            {
                correctAns++
            }
            
        }
        
        var retakeTest : Bool = false
        var result : String = ""
        if correctAns == 0 || correctAns == 1 || correctAns == 2
        {
            retakeTest = true
            result = ResultString[0]
        }
        else
        {
            result = ResultString[correctAns-2]
        }
        // show message
        let alert = UIAlertController(title: "Result", message: result, preferredStyle: .ActionSheet)
        let action2 = UIAlertAction(title: "Exit", style: .Default, handler: {
            action in
            exit(0)
        })
        alert.addAction(action2)
        
        if retakeTest == true
        {
            let action1 = UIAlertAction(title: "Retake test", style: .Default, handler: {
                action in
                self.clearAndReTest()
            })
            alert.addAction(action1)
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }

    
}

