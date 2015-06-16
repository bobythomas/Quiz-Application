//
//  QuizQuestionCell.swift
//  Assignment1
//
//  Created by boby thomas on 2015-06-14.
//  Copyright (c) 2015 boby thomas. All rights reserved.
//

import UIKit

class QuizQuestionCell: UITableViewCell {
    
    var cellID : Int = -1
    var viewControllerRef : ViewController!
    //var questionStr : String = ""
    var selectedAns : String = ""
    var answerForQ : String = ""
    
    @IBOutlet weak var checkBox1: CheckBox!
    @IBOutlet weak var checkBox1Label: UILabel!
    @IBOutlet weak var checkBox2: CheckBox!
    @IBOutlet weak var checkBox2Label: UILabel!
    @IBOutlet weak var checkBox3: CheckBox!
    @IBOutlet weak var checkBox3Label: UILabel!
    @IBOutlet weak var checkBox4: CheckBox!
    @IBOutlet weak var checkBox4Label: UILabel!
    
    @IBOutlet weak var QuestionHeading: UILabel!
    @IBOutlet weak var Question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func boxSelected(sender: CheckBox, forEvent event: UIEvent) {
        
        var bMarkAns = false
        if sender.isChecked == true
        {
            answeredArray[cellID] = false
            selectedAns = ""
        }
        else
        {
            answeredArray[cellID] = true
            bMarkAns = true
        }
        
        
        if sender.tag == 1{
            checkBox2.isChecked = false
            checkBox3.isChecked = false
            checkBox4.isChecked = false
            if bMarkAns == true
            {
                selectedAns = checkBox1Label.text!
            }
        }
        
        if sender.tag == 2{
            checkBox1.isChecked = false
            checkBox3.isChecked = false
            checkBox4.isChecked = false
            if bMarkAns == true
            {
                selectedAns = checkBox2Label.text!
            }
        }
        
        if sender.tag == 3{
            checkBox1.isChecked = false
            checkBox2.isChecked = false
            checkBox4.isChecked = false
            if bMarkAns == true
            {
                selectedAns = checkBox3Label.text!
            }
        }
        
        if sender.tag == 4{
            checkBox1.isChecked = false
            checkBox2.isChecked = false
            checkBox3.isChecked = false
            if bMarkAns == true
            {
                selectedAns = checkBox4Label.text!
            }
        }
        
        viewControllerRef.checkIfQuizComplete()
        
    }
    
    func clearCell()
    {
        cellID = -1
        checkBox1.isChecked = false
        checkBox2.isChecked = false
        checkBox3.isChecked = false
        checkBox4.isChecked = false
        selectedAns = ""
        answerForQ = ""
        
    }
    
    func isAnsCorrect()->Bool
    {
        if selectedAns == answerForQ
        {
            return true
        }
        else
        {
            return false
        }
    }
}
