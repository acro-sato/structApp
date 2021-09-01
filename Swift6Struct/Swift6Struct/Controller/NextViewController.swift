//
//  NextViewController.swift
//  Swift6Struct
//
//  Created by 佐藤史也 on 2021/04/26.
//

import UIKit
//具体的な処理内容は書かず、クラスや構造体が実装するプロパティとメソッドを定義する機能です。
protocol SetOKDelegate{
    func set(check:Person)
}

class NextViewController: UIViewController {
    
    //Person()は.swift内のstruct Person内を意味する
    var person = Person()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var syumiTextField: UITextField!
    @IBOutlet weak var movieTextField: UITextField!
    
    var setOKDelegate:SetOKDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        
        person.name = nameTextField.text!
        person.syumi = syumiTextField.text!
        person.movie = movieTextField.text!
        setOKDelegate?.set(check: person)
        
        dismiss(animated: true, completion: nil)
        
    }

}
