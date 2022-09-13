//
//  Localizable.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

class LocalizableString {
    
    //MARK: - Home
    
    struct Home {
        
    static let view_tittle = NSLocalizedString("home.title", comment: "")
    static let table_tittle = NSLocalizedString("table.tittle", comment: "")
    }
    
    //MARK: - Details
    
    struct Details {
        static let view_tittle = NSLocalizedString("details.title", comment: "")
        static let controller_identifier = NSLocalizedString( "controller.identifier", comment: "")
    }
}
