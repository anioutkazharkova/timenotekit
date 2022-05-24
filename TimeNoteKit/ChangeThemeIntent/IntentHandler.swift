//
//  IntentHandler.swift
//  ChangeThemeIntent
//
//  Created by Anna Zharkova on 23.05.2022.
//

import Intents


class IntentHandler: INExtension, ChangeThemeIntentHandling {
    
    func provideThemeOptionsCollection(for intent: ChangeThemeIntent, with completion: @escaping (INObjectCollection<ThemeData>?, Error?) -> Void) {
        let allData = [ThemeData(identifier: "Red", display: "Red"), ThemeData(identifier: "Blue", display: "Blue"), ThemeData(identifier: "Orange", display: "Orange")]
        
        completion(INObjectCollection(items: allData), nil)
    }
         
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
