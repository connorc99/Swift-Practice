//
//  ViewController.swift
//  ToDoList
//
//  Created by Connor Cole on 8/4/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var items = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt ip: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: ip)
        cell.textLabel?.text = items[ip.row]
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    
    private let table : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? [] //if null set to empty array
        title = "To Do list"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem = (UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd)))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter to do list item", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Enter Item..."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self](_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    print(text)
                    DispatchQueue.main.async {
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        //let newEntry = [text]
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                        self?.items.append(text)
                        self?.table.reloadData()
                    }
                }
            }
        }))
        present(alert, animated: true)
    }


}

