//
//  GarmentsViewController.swift
//  Garmentt
//
//  Created by Sanith Gelli on 26/06/22.
//

import Foundation
import UIKit

class GarmentsViewController: UIViewController, GarmentsDisplaying {    
    
    @IBOutlet var rightBabrButtonItem: UIBarButtonItem!
    @IBOutlet weak var garmentsTableView: UITableView!
    var presenter: GarmentsPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    func setUpNavUI() {
        navigationItem.title = "List"
        navigationItem.rightBarButtonItem = rightBabrButtonItem
        if let font = UIFont(name: "Helvetica Neue", size: 17) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
        }
    }
    
    func reload() {
        garmentsTableView.reloadData()
    }
    
    @IBAction func addGarment(_ sender: Any) {
        presenter?.showAddGarment()
    }
    
    @IBAction func didChangedSortType(_ sender: UISegmentedControl) {
        presenter?.didChangedSortType(sortType: GarmentSorter(rawValue: sender.selectedSegmentIndex) ?? .alphabet)
    }
}

extension GarmentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRows = presenter?.numberOfRows(), numberOfRows > 0 {
            tableView.backgroundView = nil
            return numberOfRows
        }
        tableView.backgroundView = backgroundView()
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "garmentsCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        if let title = presenter?.titleForRow(at: indexPath) {
            content.text = title
        }
        cell.contentConfiguration = content
        return cell
    }
    
    private func backgroundView() -> UILabel {
        let bgView = UILabel(frame: CGRect(x: 0,
                                           y: 0,
                                           width: garmentsTableView.frame.width,
                                           height: garmentsTableView.frame.height))
        bgView.text = "No Garments"
        bgView.textAlignment = .center
        return bgView
    }
}
