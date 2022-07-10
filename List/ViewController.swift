//
//  ViewController.swift
//  List
//
//  Created by 古賀遥貴 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var data = ["hi", "hey", "hello", "hellow", "good morning", "good afternoon", "good evening"]
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = data
        
        table.delegate = self
        table.dataSource = self
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            if let nextVc = segue.destination as? DetailViewController {
                if let listText = sender as? String {
                    nextVc.passedText = listText
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listText = "greeting: \(filteredData[indexPath.row])"
        performSegue(withIdentifier: "ToDetail", sender: listText)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = data
        }
        
        for word in data {
            if word.lowercased().contains(searchText.lowercased()) {
                filteredData.append(word)
            }
        }
        table.reloadData()
    }
}
