//
//  ViewController.swift
//  LocalizationKit
//
//  Created by Ravindra Kishan on 02/01/15.
//  Copyright (c) 2015 Ravindra Kishan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    let KEnglish = "en"
    let KHindi = "hi-IN"
    let KJapanese = "ja"
    
    var kit:QTLanguageKit = QTLanguageKit()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setLanguageLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setLanguageLabel()
    {
        headingLabel.text = kit.localizingTheString("Hello")
        statusLabel.text = kit.localizingTheString("Localization inside the app, without restaring or changing the iphone settings")
    }
    
    @IBAction func languageBtnTapped(sender: AnyObject)
    {
        
        
        var btn:UIButton = sender as UIButton
        
        if btn.tag == 10
        {
            kit.setUserSelectedlanguage(KEnglish)
            setLanguageLabel()
        }
        else if btn.tag == 20
        {
            kit.setUserSelectedlanguage(KHindi)
            setLanguageLabel()
        }
        else
        {
            kit.setUserSelectedlanguage(KJapanese)
            setLanguageLabel()
        }
        
    }

}

