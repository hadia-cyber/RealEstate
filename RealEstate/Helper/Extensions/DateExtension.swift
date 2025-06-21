//
//  DateExtension.swift
//  RealEstate
//
//  Created by TecSpine on 27/10/2021.
//

import Foundation
extension Date{
    
    func toString(formate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.string(from: self)
    }
    
    func toDate(_ myString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.date(from: myString) ?? Date()
    }
    
}
