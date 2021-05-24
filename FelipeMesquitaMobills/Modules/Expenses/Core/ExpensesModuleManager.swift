//
//  ExpensesModuleManager.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import Foundation

protocol ExpensesModuleManager {
    var addExpense: AddExpense { get }
    var deleteExpense: DeleteExpense { get }
    var updateExpense: UpdateExpense { get }
}

class ExpensesModuleManagerImpl: ExpensesModuleManager {
    let repo = ExpenseRepositoryFirebase()
    
    var addExpense: AddExpense {
        AddExpenseImpl(expensesRepository: repo)
    }
    
    var deleteExpense: DeleteExpense {
        DeleteExpenseImpl(expensesRepository: repo)
    }
    
    var updateExpense: UpdateExpense {
        UpdateExpenseImpl(expensesRepository: repo)
    }
}
