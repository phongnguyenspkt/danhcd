//
//  People.swift
//  TrueFlse
//
//  Created by Cong Danh on 12/17/16.
//  Copyright © 2016 Cong Danh. All rights reserved.
//

import Foundation
import UIKit

class People: UIViewController {
    var CorrectAnswer = String()
    var GoiYNumber = Int()
    var Score = 0
    var HighScore = 0
    var RandomQuestionStack: [Int] = []
    
    @IBOutlet var lblHighScore: UILabel!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var lblDapAn: UILabel!
    @IBOutlet var Photo: UIImageView!
    
    @IBOutlet var lblGoiY: UILabel!
    

    @IBOutlet var lblFalse: UIButton!
    
    @IBOutlet var lblTrue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      GoiY()
    }
    
    func alreadyExist(x: Int) -> Bool {
        if (RandomQuestionStack.count == 0) {
            
            return false
        }
        
        for item in RandomQuestionStack {
            if (item == x) {
                return true
            }
        }
        
        return false
    }
    
    func GoiY(){
        if (RandomQuestionStack.count == 10) {
            let refreshAlert = UIAlertController(title: "Finish", message: "Score: " + String(Score), preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in

                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Close", style: .Cancel, handler: { (action: UIAlertAction!) in
                
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
            return;
        }
        
        GoiYNumber = random() % 10
        
        if (!alreadyExist(GoiYNumber)) {
            RandomQuestionStack.append(GoiYNumber)
        } else {
            GoiY()
        }
        
        switch(GoiYNumber) {
        case 1:
            self.Photo.image = UIImage(named: "piercing.JPG")
            lblGoiY.text = "piercing"
            
            
            CorrectAnswer = "2"
            break
        case 2:
            self.Photo.image = UIImage(named: "practice.JPG")
            lblGoiY.text = "practive"
            
            CorrectAnswer = "1"
            break
        case 3:
            self.Photo.image = UIImage(named: "prisoner.JPG")
            lblGoiY.text = "prisoner"
           
            
            CorrectAnswer = "2"
            break
            
        case 4:
            self.Photo.image = UIImage(named: "raincoat.JPG")
            lblGoiY.text = "umbrella"
            
            
            CorrectAnswer = "1"
            break
        case 5:
            self.Photo.image = UIImage(named: "scurity.JPG")
            lblGoiY.text = "Police"
            
            
            CorrectAnswer = "1"
            break
        case 6:
            self.Photo.image = UIImage(named: "stressed.JPG")
            lblGoiY.text = "stressed"
            
            
            CorrectAnswer = "2"
            break
        case 7:
            self.Photo.image = UIImage(named: "waitress.JPG")
            lblGoiY.text = "waiter"
            
            
            CorrectAnswer = "1"
            break
        case 8:
            self.Photo.image = UIImage(named: "swimming.JPG")
            lblGoiY.text = "take a shower"
            
            
            CorrectAnswer = "1"
            break
        case 9:
            self.Photo.image = UIImage(named: "stranger.JPG")
            lblGoiY.text = "stranger"
            lblFalse.setTitle("False", forState: UIControlState.Normal)
            lblTrue.setTitle("True", forState: UIControlState.Normal)
            
            CorrectAnswer = "2"
            break
        case 10:
            self.Photo.image = UIImage(named: "emotions.JPG")
            lblGoiY.text = "emotions"
            lblFalse.setTitle("False", forState: UIControlState.Normal)
            lblTrue.setTitle("True", forState: UIControlState.Normal)
            
            CorrectAnswer = "2"
            break
        default:
            break
        }
    }
    @IBAction func bntFalse(sender: AnyObject) {
        if (CorrectAnswer == "1"){
            Score += 1
            lblScore.text = NSString(format: "Score : %i", Score) as String
            lblDapAn.text = "Good"
        }
        else{
            Score -= 1
            lblScore.text = NSString(format: "Score : %i", Score) as String
            lblDapAn.text = "WROONG!!!"
        }
        if (Score > HighScore){
            HighScore = Score
            lblHighScore.text = NSString(format: "HighScore : %i", HighScore) as String
        }

        GoiY()
        
        
    }
    @IBAction func bntTrue(sender: AnyObject) {
        if (CorrectAnswer == "2"){
            Score += 1
            lblScore.text = NSString(format: "Score : %i", Score) as String
            lblDapAn.text = "Good"
        }
        else{
            Score -= 1
            lblScore.text = NSString(format: "Score : %i", Score) as String
            lblDapAn.text = "WROONG!!!"
        }
        if (Score > HighScore){
            HighScore = Score
            lblHighScore.text = NSString(format: "HighScore : %i", HighScore) as String
        }

        GoiY()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

