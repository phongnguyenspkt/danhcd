//
//  Fruit.swift
//  TrueFalse
//
//  Created by Cong Danh on 12/17/16.
//  Copyright © 2016 Cong Danh. All rights reserved.
//

import Foundation
import UIKit

class Fruit: UIViewController {
    var CorrectAnswer = String()
    var GoiYNumber = Int()
    var Score = 0
    var HighScore = 0
    var RandomQuestionStack: [Int] = []
    var timer = NSTimer()
    
    
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var lblTrue: UIButton!
    @IBOutlet var lblFalse: UIButton!
    @IBOutlet var lblDapAn: UILabel!
    @IBOutlet var lblGoiY: UILabel!
    @IBOutlet var Photo: UIImageView!
    @IBOutlet var lblHighScore: UILabel!
    @IBOutlet var lblTime: UILabel!
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
            self.Photo.image = UIImage(named: "Apple.JPG")
            lblGoiY.text = "Apple"
        
            CorrectAnswer = "2"
            break
        case 2:
            self.Photo.image = UIImage(named: "lemon.JPG")
            lblGoiY.text = "apple"
           
            CorrectAnswer = "1"
            break
        case 3:
            self.Photo.image = UIImage(named: "Mangoes.JPG")
            lblGoiY.text = "orange"
          
            
            CorrectAnswer = "1"
           break
            
        case 4:
            self.Photo.image = UIImage(named: "melons.JPG")
            lblGoiY.text = "melons"
           
            
            CorrectAnswer = "2"
            break
        case 5:
            self.Photo.image = UIImage(named: "orange.JPG")
            lblGoiY.text = "orange"
           
            
            CorrectAnswer = "2"
            break
        case 6:
            self.Photo.image = UIImage(named: "rambutan.JPG")
            lblGoiY.text = "rambutan"
         
            
            CorrectAnswer = "2"
            break
        case 7:
            self.Photo.image = UIImage(named: "Strawberry.JPG")
        
            
            CorrectAnswer = "1"
            break
        case 8:
            self.Photo.image = UIImage(named: "tamarind.png")
            lblGoiY.text = "tamarind"
         
            
            CorrectAnswer = "2"
            break
        case 9:
            self.Photo.image = UIImage(named: "watermelon.JPG")
         
            
            CorrectAnswer = "1"
            break
        case 10:
            self.Photo.image = UIImage(named: "banana.JPG")
            
            CorrectAnswer = "2"
            break
        default: break
            
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
            //timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(Fruit.Hide), userInfo: nil, repeats: false)
        }
        else{
            Score -= 1
            lblScore.text = NSString(format: "Score : %i", Score) as String
            lblDapAn.text = "WROONG!!!"
           // timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(Fruit.Hide), userInfo: nil, repeats: false)
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


