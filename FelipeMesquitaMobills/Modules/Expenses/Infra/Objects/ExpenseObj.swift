//
//  ExpenseObj.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation
import CodableFirebase
import Firebase

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
}

extension Timestamp: TimestampType {}
