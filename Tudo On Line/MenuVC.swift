//
//  Menu.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 24/09/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var opcoesMenu = ["Filtro","Sugerir Restaurante", "Fale Conosco", "Configurações"]
    var imagensMenu = ["Filter-44","Advertising-44","message-44","Settings-44"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return opcoesMenu.count
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath)
        
        
        let opcaoMenu = opcoesMenu[indexPath.section] as String
        let iconMenu = imagensMenu[indexPath.section] as String

        cell.imageView!.image = UIImage(named: iconMenu)
        cell.textLabel!.text = opcaoMenu

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) { 
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 0 {
            performSegueWithIdentifier("SegueFiltro", sender: nil)
        }else if indexPath.section == 1 {
            performSegueWithIdentifier("SegueDicaRest", sender: nil)
        }
    }
    
    // MARK: - Actions
    
    
}
