//
//  LotteryViewController.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 14/05/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class LotteryViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView?
@IBOutlet var thirdContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.register(UINib(nibName: "OffersTableViewCell", bundle: nil), forCellReuseIdentifier: "OffersTableViewCell")
        self.tableView?.backgroundColor = UIColor.clear
        self.tableView?.backgroundView = nil
        thirdContainer.layer.borderWidth = 1
        thirdContainer.layer.borderColor = UIColor.white.cgColor
        thirdContainer.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        
    }
    

}
extension LotteryViewController : UITableViewDataSource
{
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4;
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell", for: indexPath) as! OffersTableViewCell
        
        
        return cell
        
    }
    
    
    
}
extension LotteryViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 76
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
}


