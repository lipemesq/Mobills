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

      //  ler repo =
        //expensesStore = ExpensesStoreImpl(expensesRepository: )
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
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "defaultCell")
        let expense = expensesStore.expenses[indexPath.row]
        
        cell.textLabel?.text = expense.description
        cell.detailTextLabel?.text = expense.date.description
        
        return cell
    }
}
