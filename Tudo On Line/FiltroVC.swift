//
//  FiltroVC.swift
//  Tudo On Line
//
//  Created by Orlando Amorim on 02/10/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit
import XLForm

class FiltroVC: XLFormViewController {
    
    //Pegar do servidor
    var formasDePagamento = ["Todos","Visa","MasterCard", "ELO", "Dinheiro"]
    //var arrayPG:[AnyObject] = [AnyObject]()

    private enum Tags : String {
        
        case TempoDeEntrega = "tempoDeEntrega"
        case TaxaDeEntrega = "taxaDeEntrega"
        case FormasDePagamento = "formasDePagamento"
        case SwitchFechado = "SwitchFechado"
        case SwitchPromocao = "SwitchPromocao"
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
        
        
        form = XLFormDescriptor(title: "Filtro")
        form.rowNavigationOptions = XLFormRowNavigationOptions.Enabled
        form.assignFirstResponderOnShow = true
        
        //---------------------------------
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Tempo médio de entrega:")
        form.addFormSection(section)
        
        // Tempo de Entrega
        row = XLFormRowDescriptor(tag: Tags.TempoDeEntrega.rawValue, rowType: XLFormRowDescriptorTypeSelectorSegmentedControl, title: "")
        row.selectorOptions = ["Todos", "30", "45","60"]
        row.value = "Todos"
        
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        
        section.addFormRow(row)
        
        //---------------------------------
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Taxa de entrega:")
        form.addFormSection(section)
        
        // Taxa da Entrega
        row = XLFormRowDescriptor(tag: Tags.TaxaDeEntrega.rawValue, rowType: XLFormRowDescriptorTypeSelectorSegmentedControl, title: "")
        row.selectorOptions = ["Todos", "Gratis", "5","10"]
        row.value = "Todos"
        
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        
        section.addFormRow(row)
        
        //---------------------------------
        
        section = XLFormSectionDescriptor.formSectionWithTitle("")
        form.addFormSection(section)
        
        // Formas de Pagament
        row = XLFormRowDescriptor(tag: Tags.FormasDePagamento.rawValue, rowType:XLFormRowDescriptorTypeSelectorPush, title:"Forma de Pagameto:")
        row.selectorTitle = "Formas de Pagamento"
        row.selectorOptions = formasDePagamento
        row.value = formasDePagamento[0]
        row.required = true
        
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        
        section.addFormRow(row)
        
        //---------------------------------
        
        section = XLFormSectionDescriptor.formSectionWithTitle("")
        form.addFormSection(section)
        
        //switch Mostrar Fechados
        row = XLFormRowDescriptor(tag: Tags.SwitchFechado.rawValue, rowType: XLFormRowDescriptorTypeBooleanSwitch, title: "Mostrar fechados")
        row.value = 0
        
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        
        section.addFormRow(row)
        
        
        //Switch Promocao
        row = XLFormRowDescriptor(tag: Tags.SwitchPromocao.rawValue, rowType: XLFormRowDescriptorTypeBooleanSwitch, title: "Mostrar Promoções")
        row.value = 0

        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "textLabel.textColor")
        row.cellConfig.setObject(UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), forKey: "self.tintColor")
        
        section.addFormRow(row)
        
        self.form = form
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Aplicar", style: UIBarButtonItemStyle.Plain, target: self, action: "aplicarFiltro:")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelar:")

        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    //MARK: - Pressionou o btn Salvar
    
    func aplicarFiltro(sender: UIBarButtonItem) {
        let array = self.formValidationErrors()
        for errorItem in array {
            let error = errorItem as! NSError
            let validationStatus : XLFormValidationStatus = error.userInfo[XLValidationStatusErrorKey] as! XLFormValidationStatus
            
            if  validationStatus.rowDescriptor!.tag == Tags.FormasDePagamento.rawValue  {
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
        //Salvar no servidor
        
        
    }
    
    func cancelar(sender: UIBarButtonItem) {
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
