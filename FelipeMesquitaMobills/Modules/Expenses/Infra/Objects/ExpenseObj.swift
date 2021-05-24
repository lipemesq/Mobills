//
//  ExpenseObj.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation
import CodableFirebase
import Firebase

/**
 Object used to bridge the pure Model with the database.
 
 Use `init(from model)` and `toModel()`.
 */
struct ExpenseObj: Codable {
    var id: String?
    var value: Double
    var description: String
    var date: Timestamp
    var paid: Bool
    
    func toModel() -> Expense {
        let correctDate = date.dateValue()
        return Expense(id: id, value: value, description: description, date: correctDate, paid: paid)
    }
    
    init(from model: Expense) {
        id = model.id
        value = model.value
        description = model.description
        date = Timestamp.init(date: model.date)
        paid = model.paid
    }
}

// Turns Timestamp into Codable
extension Timestamp: TimestampType {}
