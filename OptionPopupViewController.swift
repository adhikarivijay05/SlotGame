//
//  OptionPopupViewController.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 08/05/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class OptionPopupViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView?
    var isInfoPays = Bool()
    
    var tableData = ["SOUND", "VIBRATING", "FAST PLAY", "SLOW PLAY", "HIGHSCORES & ACHIVEMENTS", "NOTIFICATIONS", "JACKPOT NOTIFICATIONS", "DOUBLE UP/GAMBLE", "FACEBOOK", "WIN PRESENTATION FRAMES"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if isInfoPays == true {
            
            tableData = ["VERSION","CREDITS"]
        }
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.register(UINib(nibName: "PopUpCell", bundle: nil), forCellReuseIdentifier: "PopUpCell")
        self.tableView?.backgroundColor = UIColor.clear
        
        tableView?.tableFooterView = UIView()
        tableView?.allowsSelection = false;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
    
    func animateTable() {
        tableView?.reloadData()
        
        let cells = tableView?.visibleCells
        let tableHeight: CGFloat = tableView!.bounds.size.height
        
        for i in cells! {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells! {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0,  animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
    

}
extension OptionPopupViewController : UITableViewDataSource
{
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count;
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopUpCell", for: indexPath) as! PopUpCell
        
        if indexPath.row == 0 || indexPath.row == 1 {
            
            if isInfoPays == true {
                
                cell.switchBtn.isHidden = true

            }else{
                
                cell.switchBtn.isHidden = false

            }
            
        }else{
            
            cell.switchBtn.isHidden = true
        }
        
        
            
            cell.timerBtn? .removeFromSuperview()
        
        
        
        // let stringValue  = String(tableInts[indexPath.row])
        cell.nameLbl?.text = tableData[indexPath.row]
    
        return cell
        
    }
    
}
extension OptionPopupViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 76
    }
    
}

