//
//  DatabaseViewController.swift
//  Forebase_memo
//
//  Created by 原田澪 on 2019/07/01.
//  Copyright © 2019 原田澪. All rights reserved.
//

import UIKit
import Firebase

class DatabaseViewController: UIViewController {
    
    @IBOutlet var data: UITextView!
    @IBOutlet var name: UITextField!
    @IBOutlet var mail: UITextField!
    @IBOutlet var age: UITextField!
    
    @IBAction func doAction() {
        self.name.endEditing(true)
        let nm: String = self.name.text!
        let ml: String = self.mail.text!
        let ag: Int = Int(self.age.text!)!
        let data = [
            "name":nm,
            "mail":ml,
            "age":ag
            ] as [String : Any]
        self.people.addDocument(data: data)
    }
    
    var db: Firestore!
    var people: CollectionReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.db = Firestore.firestore()
        self.people = db.collection("people")
        self.people.getDocuments(){(querySnapshot, err) in var res: String = ""
            for val in querySnapshot!.documents {
                let nm = val.get("name") as! String
                let ml = val.get("mail") as! String
                let ag = val.get("age") as! Int
                res += nm + " [" + ml + ":" + String(ag) + "\n"
            }
            self.data.text = res
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
