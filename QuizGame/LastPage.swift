//
//  LastPage.swift
//  QuizGame
//
//  Created by Karan Patel on 4/16/22.
//

import UIKit

class LastPage: UIViewController {
    var Score:Int = 0

    @IBOutlet weak var ExitButton: UIButton!
    @IBOutlet weak var Greetings: UILabel!
    @IBOutlet weak var ScoreCardLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreCardLable.text = "\(Score)/10"
        // Do any additional setup after loading the view.
        if (Score == 10){
            Greetings.text = "Yeahh!! You Nailed it"
        }
        else if(Score >= 5 && Score < 10 ){
            Greetings.text = "Keep It Up!! Good Try"
        } else if(Score <= 5){
            Greetings.text = "Better Luck Next Time."
        }
    }
    
    
   
    @IBAction func onNextRound(_ sender: UIButton) {
      //  dismiss(animated: true)
     //  _ = navigationController?.popToRootViewController(animated: true)
      //  [self.LastPage popToRootViewControllerAnimated:YES];
        self.performSegue(withIdentifier: "goToWelcomePage", sender: self)
    }
    
}
