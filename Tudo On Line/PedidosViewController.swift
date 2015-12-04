//
//  PedidosViewController.swift
//  Tudo On Line
//
//  Created by Orlando Amorim on 30/09/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit
import PagingMenuController

class PedidosViewController: UIViewController, PagingMenuControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if self.revealViewController() != nil {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_icon-44.png"), style: UIBarButtonItemStyle.Plain, target: self.revealViewController(), action: "revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Preciso de uma verificacao com o server para saber se tem algum pedido em andamentp
        
        
        let pedidoAtual = self.storyboard?.instantiateViewControllerWithIdentifier("PedidosAndamentoVC") as! PedidosAndamentoVC
        pedidoAtual.title = "Em Andamento"
        
        let pedidosRealizados = self.storyboard?.instantiateViewControllerWithIdentifier("PedidosRealizadosVC") as! PedidosRealizadosVC
        pedidosRealizados.title = "Realizados"
        
        let viewControllers = [pedidoAtual, pedidosRealizados]
        
        let options: PagingMenuOptions = PagingMenuOptions()
        
        options.menuItemMode = PagingMenuOptions.MenuItemMode.Underline(height: 3, color: UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), horizontalPadding: 0, verticalPadding: 0)
                
        options.selectedTextColor =  UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0)
        options.menuDisplayMode = PagingMenuOptions.MenuDisplayMode.SegmentedControl
        
        
        
//        if #available(iOS 9.0, *) {
//            options.font = UIFont(name: ".SFUIText-Light", size: 20)!
//        } else {
//            options.font = UIFont(name: "HelveticaNeue-Thin", size: 20)!
//        }
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PagingMenuControllerDelegate
    
    func willMoveToMenuPage(page: Int) {
    }
    
    func didMoveToMenuPage(page: Int) {
    }
}
