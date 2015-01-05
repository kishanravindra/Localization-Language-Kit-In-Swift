//
//  QTLanguageKit.swift
//  LocalizationKit
//
//  Created by Ravindra Kishan on 02/01/15.
//  Copyright (c) 2015 Ravindra Kishan. All rights reserved.
//

import UIKit

class QTLanguageKit: NSObject
{
    
    let KDefault = "en"
    let KEnglish = "en"
    let KHindi = "hi-IN"
    let KJapanese = "ja"
    
    let KSelectedLanguage = "selectedLanguageType"
    
    let nullValue=NSNull()

    
    
    func typeOfLanguageSupported(SupportedLangauage:String)->Bool
    {
        
        if SupportedLangauage == KEnglish
        {
           return true
        }
        
        if  SupportedLangauage == KHindi
        {
            return true
        }
        
        if SupportedLangauage == KJapanese
        {
           return true
        }
        return false
    }
    
 
    func localizingTheString(languageStringKey:String) ->String
    {
        var languageSelected:String = self.languageSelected()
        print(languageSelected)
        var langpath:String = NSBundle.mainBundle() .pathForResource(languageSelected, ofType:"lproj")!
        var langBundle:NSBundle = NSBundle(path:langpath)!
        var langString:String = langBundle.localizedStringForKey(languageStringKey, value:"", table: nil)
        return langString
    }
    
    
    
    func setUserSelectedlanguage(language:String)
    {
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if typeOfLanguageSupported(language)
        {
            defaults.setObject(language, forKey: KSelectedLanguage)
        }
        else
        {
            defaults.setObject(nullValue, forKey: KSelectedLanguage)
        }
        
    }
    
    
    func languageSelected()->String
    {
        //language choosen from user
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var language:String! = defaults.stringForKey(KSelectedLanguage)
        
        //In case, no language selected
        if language == nil
        { 
            var userSelectedlanguage:NSArray = defaults.objectForKey("AppleLanguages") as NSArray!
            var orderOflanguage:String = String (userSelectedlanguage.objectAtIndex(0) as AnyObject as NSString)
            
            if self.typeOfLanguageSupported(orderOflanguage)
            {
                setUserSelectedlanguage(orderOflanguage)
            }
            else
            {
                setUserSelectedlanguage(KDefault)
            }
        }
        return defaults.stringForKey(KSelectedLanguage)!
    }
    
}
