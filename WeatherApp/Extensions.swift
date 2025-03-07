//
//  Extensions.swift
//  WeatherApp
//
//  Created by Arianna Foo on 2025-03-06.
//

import Foundation

extension Double {
    
    func roundDouble() -> String {
        return String(format: "%.0f", self) // round to zero decimalsg
    }
}
