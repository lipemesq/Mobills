//
//  ExpensesStore.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

protocol ExpensesStore {
    var delegate: ExpensesStoreDelegate? { get set }
    var expenses: [Expense] { get }
}

protocol ExpensesStoreDelegate {
    func didUpdateExpenses(to expenses: [Expense])
    func didReceivedError(_ error: Error)
}
