//
//  ViewController.swift
//  VkNewsFeed
//
//  Created by Macbook on 13.09.2022.
//

import UIKit
import VK_ios_sdk

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    @IBAction func signinTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .blue
    }


}

