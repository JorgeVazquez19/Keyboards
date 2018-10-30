//
//  TableViewController.swift
//  KeyBoards
//
//  Created by JORGE VAZQUEZ REQUEJO on 17/10/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var keyboardTableView: UITableView?
    internal var Keyboards:[KeyboardModel] = []
    
    convenience init(Keyboards:[KeyboardModel]){
        self.init()
        self.Keyboards = Keyboards
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Keyboards"
        setupBarButtonsItems()
        registerCells()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2;
        case 1:
            return 2;
        case 2:
            return 8;
        case 3:
            return 1;
        default:
            return 0;
        }
    }

    private func setupBarButtonsItems(){
        let generalBarButton = UIBarButtonItem(title: "General", style: .plain, target: self, action: #selector(generalPressed))
        navigationItem.setLeftBarButton(generalBarButton, animated: false)
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 2){
            return "All Keyboards"
        }else if(section == 3){
            return "Dictation"
        }else{
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if(section == 2){
            return "Double tapping the spacebar button will insert a period followed by a space"
        }else{
            return nil
        }
    }
    
    @objc private func generalPressed(){
        dismiss(animated: true, completion: nil)
    }
    private func registerCells(){
        let KeyboardIdentifier = "keyboardCell"
        let SwitchCellIndentifier = "SwitchCell"
        
        let cellNib = UINib(nibName: "TableViewKeyboardCell", bundle: nil)
        tableView?.register(cellNib, forCellReuseIdentifier: KeyboardIdentifier)
        
        let cellNib1 = UINib(nibName: "TableViewKeyboardSwitchCell", bundle: nil)
        tableView?.register(cellNib1, forCellReuseIdentifier: SwitchCellIndentifier)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell: UITableViewCell = UITableViewCell()

            if(indexPath.section == 0){
                let cell: TableViewKeyboardCell = (tableView.dequeueReusableCell(withIdentifier: "keyboardCell", for: indexPath) as? TableViewKeyboardCell)!
                   cell.accessoryType = .disclosureIndicator
                switch indexPath.row{
                case 0:
                    cell.lblKeyboard.text = "Keyboards"
                case 1:
                    cell.lblKeyboard.text = "Hardware Keyboard"
                default: break
                    
                }
            }
            
            if(indexPath.section == 1){
                let cell: TableViewKeyboardCell = (tableView.dequeueReusableCell(withIdentifier: "keyboardCell", for: indexPath) as? TableViewKeyboardCell)!
                   cell.accessoryType = .disclosureIndicator
                switch indexPath.row{
                case 0:
                    cell.lblKeyboard.text = "Text Replacement"
                case 1:
                    cell.lblKeyboard.text = "One Handed Keyboard"
                default: break
                }
            }
            if(indexPath.section == 2){
                let cellSwitch: TableViewKeyboardSwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? TableViewKeyboardSwitchCell)!
                switch indexPath.row{
                case 0:
                    cellSwitch.lblKeyboardSwitch.text = "Auto-Capitalization"
                case 1:
                    cellSwitch.lblKeyboardSwitch.text = "Auto-Correction"
                case 2:
                    cellSwitch.lblKeyboardSwitch.text = "Check Spelling"
                case 3:
                    cellSwitch.lblKeyboardSwitch.text = "Enable Caps Lock"
                case 4:
                    cellSwitch.lblKeyboardSwitch.text = "Predictive"
                case 5:
                    cellSwitch.lblKeyboardSwitch.text = "Smart Punctuation"
                case 6:
                    cellSwitch.lblKeyboardSwitch.text = "Character Preview"
                case 7:
                    cellSwitch.lblKeyboardSwitch.text = "'.' Shortcut"
                default: break
                }
            }
                if(indexPath.section == 3){
                    let cellSwitch: TableViewKeyboardSwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? TableViewKeyboardSwitchCell)!
                    switch indexPath.row{
                    case 0:
                        cellSwitch.lblKeyboardSwitch.text = "Enable Dictation"
                        cellSwitch.keyboardSwitch.setOn(false, animated: true)
                    default: break
                    }
                }
            
            
            
                return cell
    
            
    }
    
}

    

