//
//  TesteViewController.swift
//  Tudo On Line
//
//  Created by Orlando Amorim on 20/10/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//


import UIKit
import PagingMenuController
import TFTransparentNavigationBar

let offset_HeaderStop:CGFloat = 40.0
let offset_B_LabelHeader:CGFloat = 95.0
let distance_W_LabelHeader:CGFloat = 35.0 


class RestauranteVC: UIViewController, UIScrollViewDelegate, TFTransparentNavigationBarProtocol{
    
    func navigationControllerBarPushStyle() -> TFNavigationBarStyle {
        return .Transparent
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBOutlet var scrollView:UIScrollView!
    @IBOutlet var avatarImage:UIImageView!
    @IBOutlet var header:UIView!
    @IBOutlet var headerLabel:UILabel!
    @IBOutlet var headerImageView:UIImageView!
    @IBOutlet var headerBlurImageView:UIImageView!
    var blurredHeaderImageView:UIImageView?
    
    var offset:CGFloat = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        headerLabel.text = "Savori"
        
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        
        //Criando nosso Centro de Notificacao
        let centroDeNotificacao: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        //Na linha abaixo ele fica observando quando o "OlhaORapa" for chamado  e quando isso acontece ele executa o metodo gritouOlhaORapa
        centroDeNotificacao.addObserver(self, selector: "moveuTableViewSobre:", name: "moveuTableViewSobre", object: nil)
        
        //PAGING MENU CONTROLLER
        
        let sobre = self.storyboard?.instantiateViewControllerWithIdentifier("SobreTVC") as! SobreTVC
        sobre.title = "Informações"
        
        let cardapio = self.storyboard?.instantiateViewControllerWithIdentifier("CardapioTableVC") as! CardapioTableVC
        cardapio.title = "Cardápio"
        
    
        let localizacao = self.storyboard?.instantiateViewControllerWithIdentifier("PromocaoRestTVC") as! PromocaoTableVC
        localizacao.title = "Promoção"
        
        let viewControllers = [sobre, cardapio, localizacao]
        
        let options: PagingMenuOptions = PagingMenuOptions()
        
        options.menuItemMode = PagingMenuOptions.MenuItemMode.Underline(height: 4, color: UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0), horizontalPadding: 0, verticalPadding: 0)
        
        options.selectedTextColor =  UIColor(red: 251/255, green: 99/255, blue: 49/255, alpha: 1.0)
        options.menuDisplayMode = PagingMenuOptions.MenuDisplayMode.SegmentedControl
        options.defaultPage = 1
        
        
        //        if #available(iOS 9.0, *) {
        //            options.font = UIFont(name: ".SFUIText-Light", size: 20)!
        //        } else {
        //            options.font = UIFont(name: "HelveticaNeue-Thin", size: 20)!
        //        }
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.setup(viewControllers: viewControllers, options: options)

    }
    
    override func viewDidAppear(animated: Bool) {
        
        //avatarImage
        
        avatarImage.image = UIImage(named: "logo")
        
        // Header - Image
        
        headerImageView = UIImageView(frame: header.bounds)
        headerImageView?.image = UIImage(named: "savoriMorada")
        headerImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        header.insertSubview(headerImageView, belowSubview: headerLabel)
        
        // Header - Blurred Image
        
        headerBlurImageView = UIImageView(frame: header.bounds)
        headerBlurImageView?.image = UIImage(named: "savoriMorada")?.blurredImageWithRadius(10, iterations: 20, tintColor: UIColor.clearColor())
        headerBlurImageView?.contentMode = UIViewContentMode.ScaleAspectFill
        headerBlurImageView?.alpha = 0.0
        header.insertSubview(headerBlurImageView, belowSubview: headerLabel)
        
        header.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Criando um metodo para ser executado quando "gritarem" "olhaORapa"
    func moveuTableViewSobre(notification: NSNotification){
        let scroll = notification.object as! UIScrollView
        self.offset = scroll.contentOffset.y

        if scrollView.contentOffset.y == 145 {
            return
        }
        
        if scroll.contentOffset.y > 0 && scroll.contentOffset.y <= 145 {
            scrollView.setContentOffset(CGPointMake(0, offset), animated: false)
        }else if scroll.contentOffset.y < 0  {
            scrollView.setContentOffset(CGPointMake(0, offset), animated: false)
        }else if scroll.contentOffset.y > 150 {
            scrollView.setContentOffset(CGPointMake(0, 145), animated: false)
        }
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.offset = scrollView.contentOffset.y
        
        updateView(self.offset)
    }
    
    func updateView(offset:CGFloat){
        
        print(offset)
        
        if offset <= -70 {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
        var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity
        
        // PULL DOWN -----------------
        
        if offset < 0 {
            
            let headerScaleFactor:CGFloat = -(offset) / header.bounds.height
            let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
            
            header.layer.transform = headerTransform
        }
            
            // SCROLL UP/DOWN ------------
            
        else {
            
            // Header -----------
            
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
            
            //  ------------ Label
            
            let labelTransform = CATransform3DMakeTranslation(0, max(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0)
            headerLabel.layer.transform = labelTransform
            
            //  ------------ Blur
            
            headerBlurImageView?.alpha = min (1.0, (offset - offset_B_LabelHeader)/distance_W_LabelHeader)
            
            // Avatar -----------
            
            let avatarScaleFactor = (min(offset_HeaderStop, offset)) / avatarImage.bounds.height / 1.4 // Slow down the animation
            let avatarSizeVariation = ((avatarImage.bounds.height * (1.0 + avatarScaleFactor)) - avatarImage.bounds.height) / 2.0
            avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0)
            avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)
            
            if offset <= offset_HeaderStop {
                
                if avatarImage.layer.zPosition < header.layer.zPosition{
                    header.layer.zPosition = 0
                }
                
            }else {
                if avatarImage.layer.zPosition >= header.layer.zPosition{
                    header.layer.zPosition = 2
                }
            }
        }
        
        // Apply Transformations
        
        header.layer.transform = headerTransform
        avatarImage.layer.transform = avatarTransform

    
    
    }
}