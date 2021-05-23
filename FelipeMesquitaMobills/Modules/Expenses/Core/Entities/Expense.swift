//
//  Expense.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

struct Expense: Equatable, Codable {
    var value: Double
    var description: String
    var date: Date
    var paid: Bool
}
