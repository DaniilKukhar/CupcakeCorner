//
//  Order.swift
//  CupcakeCorner
//
//  Created by Danya Kukhar on 26.01.2023.
//

import SwiftUI

@dynamicMemberLookup
class SharedOrder: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    @Published var data = Order()
    
    subscript<T>(dynamicMember keyPath: KeyPath<Order, T>) -> T {
        data[keyPath: keyPath]
    }
    
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Order, T>) -> T {
        get {
            data[keyPath: keyPath]
        }
        set {
           data[keyPath: keyPath] = newValue
        }
            
    }
}

struct Order: Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSpinkles, name, streetAddress, city, zip
    }
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSpinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSpinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidateAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        } else if  name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // 2$ per cake
        var cost = Double(quantity) * 2
        
        // complicated cake cost more
        cost += Double(type) / 2
        
        // 1$ per cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // 0.50$ per cake for sprinkles
        if addSpinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}


