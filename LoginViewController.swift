//
//  LoginViewController.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 22/11/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit
import MediaPlayer

class LoginViewController: UIViewController {
    
    var moviePlayer: MPMoviePlayerController?
    
    
    @IBOutlet weak var pularButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var Username: UITextField?
    var Password: UITextField?
    let button  = UIButton(type: UIButtonType.System) as UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playVideo()
        //create background video/gif
        
        
        //adding label
        
        let welcomeLabel = UILabel(frame: CGRectMake(0, 100, self.view.bounds.size.width, 100))
        welcomeLabel.text = "Tudo On Line"
        welcomeLabel.textColor = UIColor.whiteColor()
        welcomeLabel.font = UIFont.systemFontOfSize(20)
        welcomeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(welcomeLabel)
        
        //adicionando botao face
        let loginBtn = UIButton(frame: CGRectMake(65, 360, 240, 35))
        loginBtn.layer.borderColor = UIColor.whiteColor().CGColor
        loginBtn.layer.borderWidth = 1
        loginBtn.titleLabel!.font = UIFont.systemFontOfSize(17)
        loginBtn.tintColor = UIColor.whiteColor()
        loginBtn.setTitle("Facebook", forState: UIControlState.Normal)
        self.view.addSubview(loginBtn)
        
        //adicionando botao pular
        let signUpBtn = UIButton(frame: CGRectMake(55, 420, 240, 35))
        signUpBtn.layer.borderColor = UIColor.whiteColor().CGColor
        signUpBtn.layer.borderWidth = 1
        signUpBtn.titleLabel!.font = UIFont.systemFontOfSize(17)
        signUpBtn.tintColor = UIColor.whiteColor()
        signUpBtn.setTitle("Pular", forState: UIControlState.Normal)
        self.view.addSubview(signUpBtn)
        
    }
    
    
    
    
    func playVideo() ->Bool {
        
        let path = NSBundle.mainBundle().pathForResource("background", ofType:"mov")
        //take path of video
        
        let url = NSURL.fileURLWithPath(path!)
        
        self.moviePlayer = MPMoviePlayerController(contentURL: url)
        //asigning video to moviePlayer
        
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            //setting the video size to the view size
            
            player.controlStyle = MPMovieControlStyle.None
            //Hiding the Player controls
            
            
            player.prepareToPlay()
            //Playing the video
            
            
            player.repeatMode = .One
            //Repeating the video
            
            player.scalingMode = .AspectFill
            //setting the aspect ratio of the player
            
            self.view.addSubview(player.view)
            //adding the player view to viewcontroller
            return true
            
        }
        return false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
