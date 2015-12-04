//
//  SugerirRestVC.swift
//  Tudo On Line
//
//  Created by Orlando Amorim on 02/10/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit
import XLForm

class SugerirRestVC: XLFormViewController {

    private enum Tags : String {

        case Nome = "nome"
        case Cidade = "cidade"
        case Telefone = "telefone"
        case Salvar = "salvar"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeForm()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initializeForm()
    }
    
    
    func initializeForm() {
        
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        
        form = XLFormDescriptor(title: "Sugerir Restaurantes")
        form.rowNavigationOptions = XLFormRowNavigationOptions.Enabled
        form.assignFirstResponderOnShow = true
        
        //---------------------------------
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Dados do Restaurante")
        form.addFormSection(section)
        
        // Name
        row = XLFormRowDescriptor(tag: Tags.Nome.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Nome:")
        row.required = true
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "self.tintColor")
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "textField.textColor")
        row.cellConfig.setObject(UIColor.clearColor(), forKey: "backgroundColor")

        section.addFormRow(row)
        
        
        // Cidade
        row = XLFormRowDescriptor(tag: Tags.Cidade.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Cidade:")
        row.required = true
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "self.tintColor")
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "textField.textColor")
        row.cellConfig.setObject(UIColor.clearColor(), forKey: "backgroundColor")
        
        section.addFormRow(row)
        
        // Telefone
        row = XLFormRowDescriptor(tag: Tags.Telefone.rawValue, rowType: XLFormRowDescriptorTypePhone, title: "Telefone:")
        row.required = true
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "textField.textColor")
        row.cellConfig.setObject(UIColor.whiteColor(), forKey: "self.tintColor")
        row.cellConfig.setObject(UIColor.clearColor(), forKey: "backgroundColor")
        
        section.addFormRow(row)
        
    
        
        //---------------------------------
        
        self.form = form
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    
    //MARK: - Pressionou o btn Salvar
    
    @IBAction func enviarSugestao(sender: UIBarButtonItem) {
        let array = self.formValidationErrors()
        for errorItem in array {
            let error = errorItem as! NSError
            let validationStatus : XLFormValidationStatus = error.userInfo[XLValidationStatusErrorKey] as! XLFormValidationStatus
            
            if  validationStatus.rowDescriptor!.tag == Tags.Nome.rawValue  {
                if let cell = self.tableView.cellForRowAtIndexPath(self.form.indexPathOfFormRow(validationStatus.rowDescriptor!)!) {
                    self.animateCell(cell)
                }
            }
        }
        
        self.tableView.endEditing(true)
        
        if array.count == 0 {
            save()
        }
        
    }
    
    //MARK: - Salvando Ficha
    
    func save () {
        
        
        if let nome:String = form.formRowWithTag(Tags.Nome.rawValue)!.value as? String {
            print(nome)
        }


        
    }

    @IBAction func cancelar(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Helperph
    
    func animateCell(cell: UITableViewCell) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values =  [0, 20, -20, 10, 0]
        animation.keyTimes = [0, (1 / 6.0), (3 / 6.0), (5 / 6.0), 1]
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.additive = true
        cell.layer.addAnimation(animation, forKey: "shake")
    }
    
    
}

