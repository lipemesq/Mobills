//
//  HomeViewController.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 23/05/21.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var expensesStore: ExpensesStore!

    override func viewDidLoad() {
        super.viewDidLoad()

        let repo = ExpenseRepositoryFirebase()
        expensesStore = ExpensesStoreImpl(expensesRepository: repo)
        expensesStore.delegate = self
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
        cell.trailingDetail.text = expense.value.formatAsCurrency()
        
        cell.trailingDetail.textColor = expense.paid ? .label.withAlphaComponent(0.75) : .orange


        return cell
    }
}
