//
//  RestaranteTableVC.swift
//  Tudo On Line
//
//  Created by Orlando Amorim on 06/10/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit
import XLForm
import MapKit

class SobreTVC: XLFormViewController {
    
    var sobre:String = String()
    var imagem:String = String()
    var arraySections:[Int : Int] = [Int : Int]()
    
    //Pegar do servidor
    var formasDePagamento = ["Todos","Visa","MasterCard", "ELO", "Credshop", "Dinheiro"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arraySections = [0:1]
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableHeaderView = nil

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeForm()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initializeForm()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arraySections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraySections[section]!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("SobreCell", forIndexPath: indexPath) as! RestSobreTVCell
        
    
        cell.textView.text = "O Coco Bambu Teresina encontra-se situado no Bairro Jockey Club, região mais nobre da cidade, mais precisamente na Avenida Dom Severino, em uma área de quase 4000 m². É sem dúvida, um dos cartões postais de Teresina e destino constante de clientes habitués e turistas."
        
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
    
        
        return cell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Informações"
        }
        
        return ""
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel!.textColor = UIColor(red: 76/255, green: 107/255, blue: 148/255, alpha: 1.0)
        header.textLabel!.textAlignment = NSTextAlignment.Center
        
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        return 45
    }
    
    */
    
    func initializeForm() {
        
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        
        form = XLFormDescriptor(title: "")
        form.rowNavigationOptions = XLFormRowNavigationOptions.Enabled
        form.assignFirstResponderOnShow = true
        
        //---------------------------------
        
        
        // Sobre
        
        section = XLFormSectionDescriptor()
        section.title = "Sobre o Restaurante"
        section.footerTitle = "O Coco Bambu Teresina encontra-se situado no Bairro Jockey Club, região mais nobre da cidade, mais precisamente na Avenida Dom Severino, em uma área de quase 4000 m². É sem dúvida, um dos cartões postais de Teresina e destino constante de clientes habitués e turistas."
        form.addFormSection(section)

        
        //---------------------------------
        
        
        // Horário de funcionamento
        
        section = XLFormSectionDescriptor()
        section.title = "Horário de Funcionamento"
        section.footerTitle = "Terça a Sexta - 18h as 2h | Sábado - 18h as 03h"
        form.addFormSection(section)
        
        
        //---------------------------------

        
        // Telefones Action Sheet
        section = XLFormSectionDescriptor()
        row = XLFormRowDescriptor(tag :"", rowType:XLFormRowDescriptorTypeSelectorActionSheet, title:"Telefones")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        row.selectorOptions = ["9954-2134", "3305-3065", "99999-2929"]
        section.addFormRow(row)
        form.addFormSection(section)
        
        //---------------------------------
        
        // Site | Fan Page | Instagram
        // Action Sheet
        section = XLFormSectionDescriptor()
        row = XLFormRowDescriptor(tag :"", rowType:XLFormRowDescriptorTypeSelectorActionSheet, title:"Site | Fan Page")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        row.selectorOptions = ["Facebook", "Nosso Site", "Instagram"]
        section.addFormRow(row)
        form.addFormSection(section)
        
        //---------------------------------
        
        
        // Localização via StoryboardId
        
        section = XLFormSectionDescriptor.formSectionWithTitle("")
        form.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: "", rowType: XLFormRowDescriptorTypeButton, title: "Localização")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        row.action.viewControllerStoryboardId = "MapViewController"
        //row.value = CLLocationMa(latitude: -5.0846649, longitude: -42.7986866)
        section.addFormRow(row)

        
        section = XLFormSectionDescriptor.formSectionWithTitle("")
        form.addFormSection(section)
        
        // Formas de Pagamento
        row = XLFormRowDescriptor(tag: "", rowType:XLFormRowDescriptorTypeSelectorPush, title:"Formas de Pagameto:")
        row.selectorTitle = "Formas de Pagamento"
        row.selectorOptions = formasDePagamento
        row.value = formasDePagamento[0]
        row.required = true
        
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        
        section.addFormRow(row)
        
        self.form = form
    }

    
//    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    
    // MARK: - Animações
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        //Criando um objeto do tipo NSNOtitcationCenter
        
        if scrollView.contentOffset.y <= 160{
            let centroDeNotificacao: NSNotificationCenter = NSNotificationCenter.defaultCenter()
            
            //ENVIANDO os dados por Object
            centroDeNotificacao.postNotificationName("moveuTableViewSobre", object: scrollView)
        }
        

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    


}
