//
//  QuizPage.swift
//  QuizGame
//
//  Created by Karan Patel on 4/14/22.
//

import UIKit

class QuizPage: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var QuestionLable: UILabel!
    private static var changeQuestion = 1
    @IBOutlet weak var nextPageButton: UIButton!
    private var SuffledAnsArray:[Optional<String>] = []
    @IBOutlet weak var QuestionNumberLable: UILabel!
    var numberOfQuestion:Int?
    private var Answere = ""
    private static var rightAnsCounter = 0
    var FinalScore = 0
    
    let defaults = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLable.numberOfLines = 5
        getQuestionAns()
       nextPageButton.isEnabled = false
        submitButton.isEnabled = false
     //   button1.layer.opacity = 0.2
        let counteQue = defaults.integer(forKey: "qc")
        print(counteQue)
        if counteQue == 0{
            QuizPage.changeQuestion = 1
        }
        else{
            QuizPage.changeQuestion = counteQue
        }
       
    
    }
    
    
    func Unable(){
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        submitButton.isEnabled = true
        
//        button1.isUserInteractionEnabled = false
//        button2.isUserInteractionEnabled = false
//        button3.isUserInteractionEnabled = false
//        button4.isUserInteractionEnabled = false
//        submitButton.isUserInteractionEnabled = true
        
    }
    func Enable(){
        button1.isEnabled = true
        
        button2.isEnabled = true
        
        button3.isEnabled = true
        
        button4.isEnabled = true
        
        submitButton.isEnabled = false
      
//        button1.isUserInteractionEnabled = true
//        button2.isUserInteractionEnabled = true
//        button3.isUserInteractionEnabled = true
//        button4.isUserInteractionEnabled = true
//        submitButton.isUserInteractionEnabled = false
    
    }
    
    func BaseStste(){
        
        button1.backgroundColor = .clear
        button2.backgroundColor = .clear
        button3.backgroundColor = .clear
        button4.backgroundColor = .clear
    }
    
    func NextQuestion(){
        if QuizPage.changeQuestion < 50{
            QuizPage.changeQuestion = QuizPage.changeQuestion + 1
        }
        else{
            QuizPage.changeQuestion = 1
        }
    }
    
    func MakeRightGreen(){
        
        
        if button1.titleLabel?.text == Answere{
            button1.backgroundColor = .systemGreen
            button1.layer.cornerRadius = 25
        
        }
        else if button2.titleLabel?.text == Answere{
            button2.backgroundColor = .systemGreen
            button2.layer.cornerRadius = 25
          
        }
        else if button3.titleLabel?.text == Answere{
            button3.backgroundColor = .systemGreen
            button3.layer.cornerRadius = 25
            
            
        }
        else if button4.titleLabel?.text == Answere{
            button4.backgroundColor = .systemGreen
            button4.layer.cornerRadius = 25
            
           
        }
        
    }

    @IBAction func onClickOption1(_ sender: UIButton) {
               
        Unable()
        if let button1Title = sender.title(for: .normal) {
            
            button1.layer.cornerRadius = 25
            if button1Title == Answere{
                button1.backgroundColor = .systemGreen
                QuizPage.rightAnsCounter = QuizPage.rightAnsCounter + 1
            }
            else{
                button1.backgroundColor = .brown
                
            }
            
            
        }
       
    MakeRightGreen()
            }
    
    
    @IBAction func onClickOption2(_ sender: UIButton) {
        Unable()
       if let button2Title = sender.title(for: .normal) {
           button2.layer.cornerRadius = 25
    
       if button2Title == Answere {
           
        button2.backgroundColor =  .systemGreen
           QuizPage.rightAnsCounter = QuizPage.rightAnsCounter + 1
       }
       else{
        button2.backgroundColor = .brown
        
    }
    
           
}
        MakeRightGreen()
    }
    
    @IBAction func onClickOption3(_ sender: UIButton) {
        Unable()
        if let button3Title = sender.title(for: .normal) {
            button3.layer.cornerRadius = 25
            
            if button3Title == Answere {
                button3.backgroundColor =  .systemGreen
                QuizPage.rightAnsCounter = QuizPage.rightAnsCounter + 1
            }
            else{
                button3.backgroundColor = .brown
                
            }
            
            
        }
      
        
        MakeRightGreen()
    }
   
    @IBAction func onClickOption4(_ sender: UIButton) {
        Unable()
        if let button4Title = sender.title(for: .normal) {
            
            button4.layer.cornerRadius = 25
            if button4Title == Answere {
                button4.backgroundColor = .systemGreen
                QuizPage.rightAnsCounter = QuizPage.rightAnsCounter + 1
            }
            else{
                button4.backgroundColor = .brown
                
            }
            

        }
        MakeRightGreen()
    }
    
    @IBAction func onClickSubmit(_ sender: UIButton) {
       
        print("Submit button pressed")
        Enable()
        BaseStste()
        
        
        if QuizPage.changeQuestion % 10 == 0 {
            FinalScore = QuizPage.rightAnsCounter
            print(QuizPage.rightAnsCounter)
            nextPageButton.isEnabled = true
            Unable()
            submitButton.isEnabled = false
            NextQuestion()
            defaults.set(QuizPage.changeQuestion, forKey: "qc")  //qc = questionCounter // counter
            QuizPage.rightAnsCounter = 0
        }
        else{
           
            nextPageButton.isEnabled = false
            NextQuestion()
            getQuestionAns()
            defaults.set(QuizPage.changeQuestion, forKey: "qc")  //qc = questionCounter  counter
        }
        
    }
    

    @IBAction func onClickNextPage(_ sender: Any) {
    
      //  self.performSegue(withIdentifier: "goToLastPage", sender: self)
       //   navigationController?.popToRootViewController(animated: true)
        self.performSegue(withIdentifier: "goToLastPage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // self.performSegue(withIdentifier: "goToLastPage", sender: self)
        if segue.identifier == "goToLastPage"{
        let destination = segue.destination as! LastPage
            
            destination.Score = FinalScore
         //   print("destination.username\(destination.userEmail)")
    }
    }
  
    
    
    
   private  func getUrl() -> URL? {
        
        
        let url = "https://opentdb.com/api.php?amount=50&category=18&difficulty=medium&type=multiple"
        return URL(string: url)
        
    }
    
    
    private func getQuestionAns() {
        //get URL
       
         
        let url = getUrl()
        guard let url = url else{
            print("Could not get data")
            return
        }
        
        //Step 2: create URLSession
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data , response , error in
            print("Network call complete")
           
                       guard  error == nil else {
                          print("received error")
                           return
                       }
                       guard let data = data else {
                           print("data not found")
                           return
                       }
                       // network call finished
           
                      if  let Quiz = self.parseJson(data: data) {
                          
                          print(Quiz.results[QuizPage.changeQuestion-1].question)
                          print(Quiz.results[QuizPage.changeQuestion-1].correct_answer)
                          print(Quiz.results[QuizPage.changeQuestion-1].incorrect_answers)
                          
                          // Creation of answere array
                          let AnsContainer = [Quiz.results[QuizPage.changeQuestion-1].correct_answer,Quiz.results[QuizPage.changeQuestion-1].incorrect_answers[0],
                                              Quiz.results[QuizPage.changeQuestion-1].incorrect_answers[1],Quiz.results[QuizPage.changeQuestion-1].incorrect_answers[2]]
                          print(AnsContainer)
                          
                          if let Ans = Quiz.results[QuizPage.changeQuestion-1].correct_answer{
                              self.Answere = Ans
                              print("Ans is = \(self.Answere)")
                          }
                          self.SuffledAnsArray = AnsContainer.shuffled()
                          print(self.SuffledAnsArray)
                           DispatchQueue.main.async {
                               // question
                               if let question = Quiz.results[QuizPage.changeQuestion-1].question{
                                   self.QuestionLable.text = question
                                 //lable
                                   self.numberOfQuestion = QuizPage.changeQuestion
                                //   print(self.numberOfQuestion)
                                   if let number = self.numberOfQuestion{
                                   self.QuestionNumberLable.text = "\(number)"
                                   }
                               }
                               
                               
                               if let Ans1 = self.SuffledAnsArray[0]{
                                   self.button1.setTitle(Ans1, for: .normal)
                               }
    
                               if let Ans2 = self.SuffledAnsArray[1]{
                                   self.button2.setTitle(Ans2, for: .normal)
                               }
                               if let Ans3 = self.SuffledAnsArray[2]{
                                   self.button3.setTitle(Ans3, for: .normal)
                               }
                               if let Ans4 = self.SuffledAnsArray[3]{
                                   self.button4.setTitle(Ans4, for: .normal)
                               }

                           }
                        
                          
                           
                       
            
          
        }
        }
        //Step 4: Start the task
        dataTask.resume()
        
    
    }
    private func parseJson(data: Data) -> QueAns? {
        let decoder = JSONDecoder()
        var queAns: QueAns?
        
        do {
            queAns = try decoder.decode(QueAns.self, from: data)
        } catch {
            print("Error parsing questions")
            print(error)
        }
        
        return queAns
    }
    
}



struct QueAns: Decodable {
    let results: [quizQueAns]
}

struct quizQueAns: Decodable {
    let question: String?
    let correct_answer: String?
    let incorrect_answers: [String]
}
