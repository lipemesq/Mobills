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
    var userDataStore: LoginStore { get }
}

class ExpensesModuleManagerImpl: ExpensesModuleManager {
    private let repo: ExpensesRepository
    private let userStore: LoginStore
    
    init(userStore: LoginStore) {
        self.userStore = userStore
        self.repo = ExpenseRepositoryFirebase(user: userStore.currentUser)
    }
    
    var addExpense: AddExpense {
        AddExpenseImpl(expensesRepository: repo)
    }
    
    var deleteExpense: DeleteExpense {
        DeleteExpenseImpl(expensesRepository: repo)
    }
    
    var updateExpense: UpdateExpense {
        UpdateExpenseImpl(expensesRepository: repo)
    }
    
    var userDataStore: LoginStore {
       userStore
    }
}
