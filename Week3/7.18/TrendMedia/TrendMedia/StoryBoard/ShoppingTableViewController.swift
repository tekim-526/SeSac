//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var shoppingTextField: UITextField!
    @IBOutlet weak var tableHeaderView: UIView!
    
    var textList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingTextField.borderColor()
        shoppingTextField.backgroundColor = .systemGray4
        
        tableHeaderView.backgroundColor = .systemGray6
        tableHeaderView.layer.cornerRadius = 10
        
        addButton.backgroundColor = .systemGray4
        addButton.layer.cornerRadius = 8
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        cell.checkListLabel.text = textList[indexPath.row]
        return cell
    }
    
    @IBAction func shoppingTextFieldAction(_ sender: UITextField) {
        textList.append(sender.text!)
        sender.text = ""
        resignFirstResponder()
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        textList.append(shoppingTextField.text!)
        shoppingTextField.text = ""
        resignFirstResponder()
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            textList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
