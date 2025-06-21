//
//  StringExtension.swift
//  RealEstate
//
//  Created by TecSpine on 27/10/2021.
//

import Foundation
extension String{
    
    func changeFormatOfDate(formate: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        if let date = dateFormatter.date(from: self){
            return date
        }
        return nil
    }
    
    func changeFormatOfStringDate(inputFormate: String, outputFormate: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormate
        let showDate = inputFormatter.date(from: self)
        inputFormatter.dateFormat = outputFormate
        return inputFormatter.string(from: showDate!)
    }
    
    func changeFormatOfDate(inputFormate: String, outputFormate: String) -> Date? {
                
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormate
        let showDate = inputFormatter.date(from: self)
        inputFormatter.dateFormat = outputFormate
        let date = inputFormatter.string(from: showDate!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormate
        if let dat = dateFormatter.date(from: date){
            return dat
        }
        
        return nil
    }
}
