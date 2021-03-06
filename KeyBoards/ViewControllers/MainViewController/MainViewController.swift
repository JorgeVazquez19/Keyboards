//
//  ViewController.swift
//  KeyBoards
//
//  Created by JORGE VAZQUEZ REQUEJO on 17/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin?.layer.cornerRadius = 5.0
        btnLogin?.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showTable(){
        let tableSV = TableViewController()
        let navigationController = UINavigationController(rootViewController: tableSV)
        navigationController.modalTransitionStyle = .flipHorizontal
        //navigationController.navigationBar.isTranslucent = false
        present(navigationController, animated: true, completion: nil)
    }
    @IBAction func ActionLogin(_ sender: UIButton){
            showTable()
        }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
