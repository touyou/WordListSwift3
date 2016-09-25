//
//  AddViewController.swift
//  wordList0625
//
//  Created by yuki takei on 2016/06/26.
//  Copyright © 2016年 yuki takei. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var englishTextField:UITextField!
    @IBOutlet weak var japaneseTextField:UITextField!
    
    var wordArray = [Dictionary<String, String>]()
    var saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if saveData.object(forKey: "WORD") != nil {
            wordArray = saveData.object(forKey: "WORD") as! Array
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveWord(){
        let wordDictionary = ["english":englishTextField.text!, "japanese":japaneseTextField.text!]
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message:  "単語の登録が完了しました",
            preferredStyle: UIAlertControllerStyle.alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.default,
                handler: nil
            )
        )
        
        self.present(alert,animated:true, completion:nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
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
