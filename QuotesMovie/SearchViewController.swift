//
//  SearchViewController.swift
//  QuotesMovie
//
//  Created by admin on 16/05/1443 AH.
//

import UIKit


class SearchViewController: UIViewController  {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rightAnswerLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    //A struct that contain the quseions and the answers
    struct Quizdata{
        var data = [
            Dataset(questionString: "May the Force be with you",
                    correctAnswer: "Vikings"),
            Dataset(questionString: "Keep your friends close, but your enemies closer",
                    correctAnswer: "Gotham"),
            Dataset(questionString: "Today, I consider myself the luckiest man on the face of the earth",
                    correctAnswer: "Power"),
            Dataset(questionString: "You is kind. You is smart. You is important",
                    correctAnswer: "Narcos"),
            Dataset(questionString: "When you realize you want to spend the rest of your life with somebody, you want the rest of your life to start as soon as possible",
                    correctAnswer: "Interstellar"),
            Dataset(questionString: "If you let my daughter go now, that'll be the end of it. I will not look for you, I will not pursue you. But if you don't, I will look for you, I will find you, and I will kill you",
                    correctAnswer: "300"),
            Dataset(questionString: "I'm walking here! I'm walking here!",
                    correctAnswer: "Avatar"),
            Dataset(questionString: "Badges? We ain't got no badges! We don't need no badges! I don't have to show you any stinking badges!",
                    correctAnswer: "Doctor Strange"),
            Dataset(questionString: "Gentlemen, you can't fight in here! This is the war room!",
                    correctAnswer: "Game of Thrones")
            
        ]
    }
    var movieName: String?
    var movieImage: String?
    var score: Int = 0
    let allQuestions = Quizdata()
    
    struct Dataset {
        var questionString = String()
        var correctAnswer = String()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightAnswerLabel.isHidden = true
        for q in allQuestions.data{
            if q.correctAnswer == movieName{
                quoteLabel.text = q.questionString
            }
        }
    }
    func checkTextField(){
        for q in allQuestions.data{
            if q.correctAnswer == movieName{
                if searchField.text == movieName{
                    score += 1
                    scoreLabel.text = "Score: \(score)"
                    let imageVC = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
                    imageVC.imageLink = movieImage
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                else{
                    scoreLabel.text = "Try Again !!"
                }
            }
        }
    }
    
    @IBAction func checkAnswerAction(_ sender: UIButton) {
        checkTextField()
        
    }
    @IBAction func showAnswer(_ sender: UIButton) {
        rightAnswerLabel.isHidden = false
        for q in allQuestions.data{
            if q.correctAnswer == movieName{
                rightAnswerLabel.text = "The right Answer is \(q.correctAnswer)"
                
            }
        }
        
    }
    
    @IBAction func repickMovie(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
