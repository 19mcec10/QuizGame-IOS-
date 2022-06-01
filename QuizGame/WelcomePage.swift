//
//  ViewController.swift
//  QuizGame
//
//  Created by Karan Patel on 4/14/22.
//

import UIKit

class WelcomePage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onGamePage(_ sender: UIButton) {
    
        self.performSegue(withIdentifier: "goToQuizGame", sender: self)
    }
}

