//
//  ViewController.swift
//  ExampleMVVM
//
//  Created by Álvaro Ávalos Hernández on 28/08/20.
//  Copyright © 2020 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = UserViewModel()
    var dataSourceArray = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getDataFromAPIHandlerClass(url: EndPoint.strUrl) { (_) in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = viewModel.getUsetAtArray(in: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        
        cell.idLabel.text = "\(user.id ?? 0)"
        cell.userIDLabel.text = "\(user.userId ?? 0)"
        cell.userLabel.text = "\(user.title ?? "")"
        cell.bodyLabel.text = "\(user.body ?? "")"
        
        return cell
    }
    
}
