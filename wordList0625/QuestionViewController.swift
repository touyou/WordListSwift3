//
//  QuestionViewController.swift
//  wordList0625
//
//  Created by yuki takei on 2016/06/26.
//  Copyright © 2016年 yuki takei. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var answerLabel:UILabel!
    
    var isAnswered: Bool = false
    var wordArray = [Dictionary<String, String>]()
    var shuffledWordArray = [Dictionary<String, String>]()
    var nowNumber: Int = 0
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func shuffle(){
        while wordArray.count > 0 {
            let index = Int(arc4random()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    
    @IBAction func nextButtonPushed(){
        
        if isAnswered{
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"]
                isAnswered = false
                
                nextButton.setTitle("答えを表示", for: UIControlState())

            }else{
                self.performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else{
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: UIControlState())
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
