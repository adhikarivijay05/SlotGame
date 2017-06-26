//
//  PopUpViewController.swift
//  SlotGame
//
//  Created by Nitin Chauhan on 14/03/17.
//  Copyright © 2017 CC. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView?
    let tableData = ["BUY CREDITS","USER PROFILE", "OPTION", "INFO AND PAYS" ,"GO TO MAP"]
    let tableImageData = ["option", "tick", "tick", "question" ,"gotoMap"]

     var timer = Timer()
    var timeLbl = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.register(UINib(nibName: "PopUpCell", bundle: nil), forCellReuseIdentifier: "PopUpCell")
        self.tableView?.backgroundColor = UIColor.clear
        
       tableView?.tableFooterView = UIView()
        tableView?.allowsSelection = true;

        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
            target: self,
            selector: #selector(tick),
            userInfo: nil,
            repeats: true)

        // Do any additional setup after loading the view.
    }
    
    @objc func tick() {
        timeLbl = DateFormatter.localizedString(from: NSDate() as Date,
                                                                        dateStyle: .none,
                                                                        timeStyle: .medium)
        tableView?.reloadData()

    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension PopUpViewController : UITableViewDataSource
{
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count;
        
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopUpCell", for: indexPath) as! PopUpCell
        cell.timerBtn?.layer.cornerRadius = 10
        let myColor : UIColor = UIColor.yellow
        cell.timerBtn?.layer.borderColor = myColor.cgColor
        cell.timerBtn?.layer.borderWidth = 2
        if indexPath.row == 0 {
            
            cell.timerBtn? .setTitle(timeLbl, for: UIControlState.normal)

        }else
        {
            cell.timerBtn?.isHidden = true
        }
        
        cell.switchBtn.isHidden = true
           // let stringValue  = String(tableInts[indexPath.row])
            cell.nameLbl?.text = tableData[indexPath.row]
        
        cell.nameImg.image = UIImage(named: tableImageData[indexPath.row])
        
        return cell
        
    }
    
   
    
}
extension PopUpViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 76
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 1 {
            
            let userProfile = UserProfilePopUpViewController.init(nibName: "UserProfilePopUpViewController", bundle: nil)
            
            self.navigationController?.pushViewController(userProfile, animated: false)

            
        }
        
        if  indexPath.row == 2 {
            
            let optionPopUP = OptionPopupViewController.init(nibName: "OptionPopupViewController", bundle: nil)
            optionPopUP.isInfoPays = false
            self.navigationController?.pushViewController(optionPopUP, animated: false)
            
            
           
        }
        
        if indexPath.row == 3{
            
            let optionPopUP = OptionPopupViewController.init(nibName: "OptionPopupViewController", bundle: nil)
            optionPopUP.isInfoPays = true
            self.navigationController?.pushViewController(optionPopUP, animated: false)
            
            
            
        }
        
        if indexPath.row == 4{
            
            let mapViewController = ZCGameViewController.init(nibName: "ZCGameViewController", bundle: nil)
            self.navigationController?.pushViewController(mapViewController, animated: false)
        }
    }
    
}



