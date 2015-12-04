//
//  Restaurantes.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 15/09/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit
import TFTransparentNavigationBar

class RestaurantesTableVC: UITableViewController, TFTransparentNavigationBarProtocol {
    
    func navigationControllerBarPushStyle() -> TFNavigationBarStyle {
        return TFNavigationBarStyle.Solid
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.barHideOnSwipeGestureRecognizer

        
        if self.revealViewController() != nil {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_icon-44"), style: UIBarButtonItemStyle.Plain, target: self.revealViewController(), action: "revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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
    


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Restaurantes", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("RestSegue", sender: nil)
    }

}
