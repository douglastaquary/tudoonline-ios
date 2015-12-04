//
//  PedidosAndamentoVC.swift
//  Tudo On Line
//
//  Created by Orlando Amorim on 01/10/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit

class PedidosAndamentoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var noRestuarantImage: UIImageView!
    @IBOutlet weak var labelNenhumPedido: UILabel!
    @IBOutlet weak var labelProcureComida: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.hidden = true
        activityIndicator.startAnimating()
        //noRestuarantImage.hidden = true
        //labelNenhumPedido.hidden = true
        //labelProcureComida.hidden = true
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //tableView.hidden = false
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellAndamento", forIndexPath: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = "OLA"
        
        return cell
    }


}
