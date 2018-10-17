//
//  ViewController.swift
//  Test_wipro
//
//  Created by Amit on 16/10/18.
//  Copyright © 2018 Asti Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    

    var arrList = [Row]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        MainParserObject.callWebserviceForImage { (data) in
            self.arrList = data.rows ?? []
            self.tableView.reloadData()
        }
        
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        cell.fillData(obj: arrList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
}

