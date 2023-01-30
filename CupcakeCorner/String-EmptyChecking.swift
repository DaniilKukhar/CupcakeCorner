//
//  String-Extension.swift
//  CupcakeCorner
//
//  Created by Danya Kukhar on 28.01.2023.
//

import Foundation

extension String {
    
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
