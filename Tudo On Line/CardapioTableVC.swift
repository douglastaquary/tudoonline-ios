//
//  CardapioCVC.swift
//  Tudo On Line
//
//  Created by Orlando Amorim on 19/10/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit


class CardapioTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        //self.view.addSubview(button)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 30
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CardapioCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = "Camarao"
        cell.detailTextLabel?.text = "R$ 20,00"
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        //Criando um objeto do tipo NSNOtitcationCenter
        
        let centroDeNotificacao: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        
        //ENVIANDO os dados por Object
        centroDeNotificacao.postNotificationName("moveuTableViewSobre", object: scrollView)
    }
}
