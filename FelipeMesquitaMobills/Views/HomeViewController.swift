//
//  HomeViewController.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import UIKit

class HomeViewController: UITableViewController {
    var moduleManager: ExpensesModuleManager!
    var expensesStore: ExpensesStore!

    override func viewDidLoad() {
        super.viewDidLoad()

        let repo = ExpenseRepositoryFirebase(user: moduleManager.userDataStore.currentUser)
        expensesStore = ExpensesStoreImpl(expensesRepository: repo)
        expensesStore.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func showAddExpensePanel() {
        if let navigationController = self.storyboard?.instantiateViewController(identifier: "editExpense") as? UINavigationController {
            if let editExpenseView = navigationController.children.first as? EditExpenseTableViewController {
                editExpenseView.doAddExpense = moduleManager.addExpense
                
                self.present(navigationController, animated: true, completion: nil)
            }
        }
    }
    
    
    private func showEditExpensePanel(for expense: Expense) {
        if let navigationController = self.storyboard?.instantiateViewController(identifier: "editExpense") as? UINavigationController {
            if let editExpenseView = navigationController.children.first as? EditExpenseTableViewController {
                editExpenseView.currentExpense = expense
                
                editExpenseView.doUpdateExpense = moduleManager.updateExpense
                editExpenseView.doDeleteExpense = moduleManager.deleteExpense
                
                self.present(navigationController, animated: true, completion: nil)
            }
        }
    }
    
    private func logout() {
        let doLogout = moduleManager.doLogout
        doLogout() { error in
            let loginView = (self.storyboard?.instantiateViewController(identifier: "loginView"))!
            self.navigationController?.setViewControllers([loginView], animated: true)
        }
    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        showAddExpensePanel()
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        logout()
    }
    
}

// MARK: EXPENSES DELEGATE
extension HomeViewController: ExpensesStoreDelegate {
    func didUpdateExpenses(to expenses: [Expense]) {
        self.tableView.reloadData()
    }
    
    func didReceivedError(_ error: Error) {
        
    }
}


// MARK: TABLE VIEW
extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expensesStore.expenses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        let expense = expensesStore.expenses[indexPath.row]
        
        cell.title.text = expense.description
        cell.subtitle.text = "\(expense.date.day) " + Months(rawValue: expense.date.month)!.short
        cell.trailingDetail.text = "- " +  expense.value.formatAsCurrencyNoSymbolNoCents()!
        
        cell.trailingDetail.textColor = expense.paid ? .red.withAlphaComponent(0.85) : .orange.withAlphaComponent(0.7)


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showEditExpensePanel(for: expensesStore.expenses[indexPath.row])
    }
}
