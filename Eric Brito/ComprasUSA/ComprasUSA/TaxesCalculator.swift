//
//  File.swift
//  ComprasUSA
//
//  Created by Joao Queiroz on 15/01/21.
//  Copyright © 2021 Joao Queiroz. All rights reserved.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    
    var dollar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double{
        return shoppingValue * dollar
    }
    
    var stateTaxValue: Double{
        return shoppingValue * stateTax/100
    }
    
    var iofValue: Double{
        return (shoppingValue+stateTaxValue)*iof/100
    }
    
    func convertToDouble(_ string: String) -> Double{
        formatter.numberStyle = .none
        if let formated = formatter.number(from: string)?.doubleValue{
            return formated
        }else{
            return 0
        }
    }
    
    func calculate(useCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxValue
        if useCreditCard{
            finalValue += iofValue
        }
        return finalValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String{
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(from: NSNumber(value: value))!
    }
    
    private init(){
        formatter.usesGroupingSeparator = true
    }
}
