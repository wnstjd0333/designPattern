//
//  ViewController.swift
//  delegateTable
//
//  Created by kimjunseong on 2020/02/07.
//  Copyright © 2020 kimjunseong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        print("\(String(describing: self)), \(#function)")
        
//        Context.shard.loginId
        //TODO: チェックする。
        
    
        if let aa = UIApplication.shared.delegate as? AppDelegate {
            print(aa.test)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(#function)")
        
        
    }
    
    override func viewDidLayoutSubviews() {
        print("\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("\(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("\(#function)")
    }
    
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        
        print("\(#function)")
        
        view.setNeedsLayout()
        
        view.layoutIfNeeded()
    }
}
 
//MARK: UITableViewDelegate
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

//MARK: UITableViewDataSource
extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
}
