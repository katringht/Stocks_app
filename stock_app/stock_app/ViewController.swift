//
//  ViewController.swift
//  stock_app
//
//  Created by Ekaterina Tarasova on 05.03.2021.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var field: UITextField!
    @IBOutlet var table: UITableView!
    var stocks = ["APLL", "NIKE", "LNV"]
    var substock = ["Apple Inc.", "Nike", "Lenova"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "magnifyingglass")
        imageView.image = image
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        field.layer.cornerRadius = 25
        field.layer.borderWidth = 0.8
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.masksToBounds = true
        field.textColor = UIColor.black
        field.attributedPlaceholder = NSAttributedString(string: "Find company or ticker", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.leftView = imageView
        field.leftViewMode = .always
        field.leftView?.tintColor = UIColor.black

        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        
    }
    //field
    func textFieldShouldReturn(_ textField: UITextField)-> Bool {
        search()
        
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func search() {
        
    }
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "stocksCell") as! StocksCell
        let stock = stocks[indexPath.row]
        let sub = substock[indexPath.row]
        
        cell.shortLabel.text = stock
        cell.fullLabel.text = sub
        cell.imageStock.image = UIImage(named: stock)
        
        cell.stoksView.layer.cornerRadius = cell.frame.height / 2.5
//        cell.imageStock.layer.cornerRadius = cell.frame.height / 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

//struct Stock {
//
//}

