//
//  ViewController.swift
//  Quiz3
//
//  Created by Pedro Paulo on 02/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var buttonAnswer1: UIButton!
    @IBOutlet weak var buttonAnswer2: UIButton!
    @IBOutlet weak var buttonAnswer3: UIButton!
    @IBOutlet weak var buttonAnswer4: UIButton!
    @IBOutlet weak var buttonAnswer5: UIButton!
    @IBOutlet weak var buttonAnswer6: UIButton!
    @IBOutlet weak var buttonAnswer7: UIButton!
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var labelFeedback: UILabel!
    @IBOutlet weak var buttonFeedback: UIButton!
    
    var questions: [Question]!
    var currentQuestion = 0
    var grade = 0.0
    var quizEnded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q0answer0 = Answer(answer: "Vice-governador", isCorrect: true)
        let q0answer1 = Answer(answer: "Deputado Federal", isCorrect: false)
        let q0answer2 = Answer(answer: "Deputado Estadual", isCorrect: false)
        let q0answer3 = Answer(answer: "Prefeito", isCorrect: false)
        let q0answer4 = Answer(answer: "Presidente do PSDB", isCorrect: false)
        let q0answer5 = Answer(answer: "Senador", isCorrect: false)
        let q0answer6 = Answer(answer: "Vice-presidente", isCorrect: false)
        let question0 = Question(question: "Qual cargo Claudio Lembo já ocupou?", stringNameFile: "claudio lembo", answer: [q0answer0, q0answer1, q0answer2, q0answer3, q0answer4, q0answer5, q0answer6])
        
        let q1answer0 = Answer(answer: "Lula (Primeiro Mandato)", isCorrect: true)
        let q1answer1 = Answer(answer: "Dilma Rousseff", isCorrect: false)
        let q1answer2 = Answer(answer: "Fernando Henrique Cardoso", isCorrect: false)
        let q1answer3 = Answer(answer: "José Sarney", isCorrect: false)
        let q1answer4 = Answer(answer: "Fernando Collor", isCorrect: false)
        let q1answer5 = Answer(answer: "Itamar Franco", isCorrect: true)
        let q1answer6 = Answer(answer: "Lula (Segundo Mandato)", isCorrect: false)
        let question1 = Question(question: "Ciro Gomes foi Ministro da Fazenda em quais governos (selecione 2)?", stringNameFile: "ciro gomes", answer: [q1answer0, q1answer1, q1answer2, q1answer3, q1answer4, q1answer5, q1answer6], isMultipleAnswer: true, countAnswers: 2)
        
        let q2answer0 = Answer(answer: "Cauê Macris, deputado estadual", isCorrect: false)
        let q2answer1 = Answer(answer: "Cauê Macris, secretário da fazenda", isCorrect: false)
        let q2answer2 = Answer(answer: "Emerson Kapaz, deputado federal", isCorrect: false)
        let q2answer3 = Answer(answer: "Emerson Kapaz, deputado federal", isCorrect: false)
        let q2answer4 = Answer(answer: "Fernando Holiday, vereador", isCorrect: false)
        let q2answer5 = Answer(answer: "Bruno Covas, secretário de obras", isCorrect: false)
        let q2answer6 = Answer(answer: "Bruno Covas, vice-prefeito", isCorrect: true)
        let question2 = Question(question: "Quem é este político e qual cargo ele ocupa atualmente?", stringNameFile: "bruno covas", answer: [q2answer0, q2answer1, q2answer2, q2answer3, q2answer4, q2answer5, q2answer6])
        
        let q3answer0 = Answer(answer: "Arselino Tatto, vereador", isCorrect: false)
        let q3answer1 = Answer(answer: "Celso Jatene, vereador", isCorrect: false)
        let q3answer2 = Answer(answer: "Police Neto, vereador", isCorrect: false)
        let q3answer3 = Answer(answer: "Alberto Goldman, vice-governador", isCorrect: true)
        let q3answer4 = Answer(answer: "José Eduardo Cardoso, vice-prefeito", isCorrect: false)
        let q3answer5 = Answer(answer: "Vanderlei Macris, deputado estadual", isCorrect: false)
        let q3answer6 = Answer(answer: "Fleury, governador", isCorrect: false)
        let question3 = Question(question: "Qual o nome deste político e qual cargo ele já ocupou?", stringNameFile: "alberto goldman", answer: [q3answer0, q3answer1, q3answer2, q3answer3, q3answer4, q3answer5, q3answer6])
        
        let q4answer0 = Answer(answer: "Vereadora", isCorrect: false)
        let q4answer1 = Answer(answer: "Deputada Estadual", isCorrect: false)
        let q4answer2 = Answer(answer: "Vice-prefeita", isCorrect: true)
        let q4answer3 = Answer(answer: "Secretária do Turismo", isCorrect: false)
        let q4answer4 = Answer(answer: "Ministra da Cultura", isCorrect: false)
        let q4answer5 = Answer(answer: "Senadora da República", isCorrect: false)
        let q4answer6 = Answer(answer: "Sub-prefeita da Sé", isCorrect: false)
        let question4 = Question(question: "Qual cargo Nadia Campeão já ocupou?", stringNameFile: "nadia campeao", answer: [q4answer0, q4answer1, q4answer2, q4answer3, q4answer4, q4answer5, q4answer6])
        
        let q5answer0 = Answer(answer: "PMDB, vice-prefeito", isCorrect: false)
        let q5answer1 = Answer(answer: "PSB, vice-governador", isCorrect: true)
        let q5answer2 = Answer(answer: "PT, deputado estadual", isCorrect: false)
        let q5answer3 = Answer(answer: "PROS, deputado estadual", isCorrect: false)
        let q5answer4 = Answer(answer: "DEM, ministro dos transportes", isCorrect: false)
        let q5answer5 = Answer(answer: "PP, minsitro da defesa", isCorrect: false)
        let q5answer6 = Answer(answer: "PSOL, prefeito", isCorrect: false)
        let question5 = Question(question: "Qual o partido e o cargo ocupado por este político?", stringNameFile: "marcio franca", answer: [q5answer0, q5answer1, q5answer2, q5answer3, q5answer4, q5answer5, q5answer6])
        
        questions = [question0, question1, question2, question3, question4, question5]
        
        startQuiz()
    }
    
    func startQuiz(){
        
        questions.shuffle()
        for i in 0..<questions.count{
            questions[i].answers.shuffle()
        }
        
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0)
    }
    
    func showQuestion(_ questionId: Int){
        
        buttonAnswer1.isEnabled = true
        buttonAnswer2.isEnabled = true
        buttonAnswer3.isEnabled = true
        buttonAnswer4.isEnabled = true
        buttonAnswer5.isEnabled = true
        buttonAnswer6.isEnabled = true
        buttonAnswer7.isEnabled = true
        
        labelQuestion.text = questions[questionId].stringQuestion
        imageQuestion.image = questions[questionId].imageQuestion
        buttonAnswer1.setTitle(questions[questionId].answers[0].stringAnswer, for: UIControlState())
        buttonAnswer2.setTitle(questions[questionId].answers[1].stringAnswer, for: UIControlState())
        buttonAnswer3.setTitle(questions[questionId].answers[2].stringAnswer, for: UIControlState())
        buttonAnswer4.setTitle(questions[questionId].answers[3].stringAnswer, for: UIControlState())
        buttonAnswer5.setTitle(questions[questionId].answers[4].stringAnswer, for: UIControlState())
        buttonAnswer6.setTitle(questions[questionId].answers[5].stringAnswer, for: UIControlState())
        buttonAnswer7.setTitle(questions[questionId].answers[6].stringAnswer, for: UIControlState())
        
    }
    
    var multiAnswersIds = [0]
    
    func processAnswer(id: Int) {
        if (questions[currentQuestion].isMultipleAnswer) {
            if (multiAnswersIds.count < questions[currentQuestion].countAnswers) {
                multiAnswersIds.append(id)
                
                switch id {
                case 0:
                    buttonAnswer1.isEnabled = false;
                case 1:
                    buttonAnswer2.isEnabled = false;
                case 2:
                    buttonAnswer3.isEnabled = false;
                case 3:
                    buttonAnswer4.isEnabled = false;
                case 4:
                    buttonAnswer5.isEnabled = false;
                case 5:
                    buttonAnswer6.isEnabled = false;
                case 6:
                    buttonAnswer7.isEnabled = false;
                default:
                    print("foda se")
                }
            }
            
            if(multiAnswersIds.count >= questions[currentQuestion].countAnswers) {
                for i in 0..<multiAnswersIds.count{
                    print(multiAnswersIds[i])
                    print(questions[currentQuestion].answers[multiAnswersIds[i]].stringAnswer)
                }
                selectAnswer(multiAnswersIds)
            }
            
        } else {
            // single question
            selectAnswer(id)
        }
    }
    
    @IBAction func chooseAnswer1(_ sender: Any) {
        print ("pressionou botão 1")
        processAnswer(id: 0)
    }
    
    @IBAction func chooseAnswer2(_ sender: Any) {
        print ("pressionou botão 2")
        processAnswer(id: 1)
    }
    
    @IBAction func chooseAnswer3(_ sender: Any) {
        print ("pressionou botão 3")
        processAnswer(id: 2)
    }
    
    @IBAction func chooseAnswer4(_ sender: Any) {
        print ("pressionou botão 4")
        processAnswer(id: 3)
    }
    
    @IBAction func chooseAnswer5(_ sender: Any) {
        print ("pressionou botão 5")
        processAnswer(id: 4)
    }
    
    @IBAction func chooseAnswer6(_ sender: Any) {
        print ("pressionou botão 6")
        processAnswer(id: 5)
    }
    
    @IBAction func chooseAnswer7(_ sender: Any) {
        print ("pressionou botão 7")
        processAnswer(id: 6)
    }
    
    func selectAnswer(_ answerId: [Int]){
        for i in 0..<answerId.count {
            selectAnswer(i);
        }
    }
    
    func resetView() {
        buttonAnswer1.isEnabled = false
        buttonAnswer2.isEnabled = false
        buttonAnswer3.isEnabled = false
        buttonAnswer4.isEnabled = false
        buttonAnswer5.isEnabled = false
        buttonAnswer6.isEnabled = false
        buttonAnswer7.isEnabled = false
        viewFeedback.isHidden = false
        multiAnswersIds.removeAll();
    }
    
    func selectAnswer(_ answerId: Int){
        
        resetView()
        
        let answer: Answer = questions[currentQuestion].answers[answerId]
        
        if(answer.isCorrect == true){
            grade = grade + 1.0
            labelFeedback.backgroundColor = UIColor.green
            labelFeedback.text = answer.stringAnswer + "\n\nResposta Correta!!!"
            labelFeedback.textColor = UIColor.black
        }else{
            labelFeedback.backgroundColor = UIColor.red
            labelFeedback.text = answer.stringAnswer + "\n\nResposta Errada!!!"
        }
        
        if(currentQuestion < questions.count - 1 ){
            buttonFeedback.setTitle("Próxima", for: UIControlState())
        }else{
            buttonFeedback.setTitle("Ver Nota", for: UIControlState())
        }
    }
    
    @IBAction func buttonFeebackAction(_ sender: Any) {
        print("pressionou botão feedback")
        viewFeedback.isHidden = true
        
        if(quizEnded){
            startQuiz()
        }else{
            nextQuestion()
        }
    }
    
    func nextQuestion(){
        currentQuestion += 1
        
        if(currentQuestion < questions.count){
            showQuestion(currentQuestion)
        }else{
            endQuiz()
        }
    }
    
    func endQuiz(){
        grade = grade / Double(questions.count) * 100.0
        quizEnded = true
        viewFeedback.isHidden = false
        labelFeedback.text = "Sua nota: \(grade)"
        labelFeedback.backgroundColor = UIColor.white
        buttonFeedback.setTitle("Refazer", for: UIControlState())
        
    }
}

