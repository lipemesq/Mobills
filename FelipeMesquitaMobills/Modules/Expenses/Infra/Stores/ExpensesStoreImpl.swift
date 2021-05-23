//
//  ExpensesStoreImpl.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

class ExpensesStoreImpl: ExpensesStore {
    private let expensesRepository: ExpensesRepository
    
    var delegate: ExpensesStoreDelegate?
    
    var expenses: [Expense] = []
    
    init(expensesRepository: ExpensesRepository) {
        self.expensesRepository = expensesRepository
        bindExpenses()
    }
    
    private func bindExpenses() {
        expensesRepository.bindExpenses { result in
            self.expenses = result
            self.delegate?.didUpdateExpenses(to: self.expenses)
        }
    }
}
