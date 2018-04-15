//
//  ViewController.swift
//  UpsideDownTableView
//
//  Created by Nishu Priya on 4/15/18.
//  Copyright © 2018 Nishu Priya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let fixedItems = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var dataToPopulate = ["singleRow"]
    @IBOutlet weak var upsideDownTableView: UpsideDownTableView!
    @IBAction func loadMorePressed(_ sender: Any) {
        print("loadMore")
        if items.count > 0 {
            let itemToAppend = items.first
            let indexPath = IndexPath(item: 0, section: 0)
            dataToPopulate.insert(itemToAppend!, at: 0)
            items.remove(at: 0)
            upsideDownTableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        let first = dataToPopulate.last
        dataToPopulate.removeAll()
        dataToPopulate.append(first!)
        items = fixedItems
        upsideDownTableView.reloadSections(IndexSet(0..<1), with: .automatic)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        upsideDownTableView.delegate = self
        upsideDownTableView.dataSource = self
        upsideDownTableView.tableFooterView = UIView(frame: CGRect.zero)
        upsideDownTableView.backgroundColor = UIColor.clear
        upsideDownTableView.transform = CGAffineTransform.init(rotationAngle: (CGFloat(-(Double.pi))))
    }
    
    // MARK: UITableViewDelegates and datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToPopulate.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "\(dataToPopulate[indexPath.row])"
        cell?.transform = CGAffineTransform.init(rotationAngle: (CGFloat(-(Double.pi))))
        return cell!
    }
}

