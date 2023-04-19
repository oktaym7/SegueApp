//
//  ViewController.swift
//  SegueApp
//
//  Created by Oktay Temel on 17.04.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    var userName: String?
    
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//         Lifecycle
        print("viewDidLoad function called")
        
        
        if let name = userName {
             print(name)
        }
        
        
        guard let name = userName else {
            return
        }
        
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDissappear function called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
        nameText.text = ""
    }
    
    
    

    @IBAction func nextClicked(_ sender: Any) {
        userName = nameText.text!
        //performSegue(withIdentifier: "toSecondVC", sender: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.myName = userName ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        //let destinationVC = SecondViewController
        //destinationVC.myName = userName ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName ?? ""
        }
    }
    
}

struct News {
    let name: String
    let surname: String
}

