//
//  DropDownTableView.swift
//  DropDown
//
//  Created by Mohamed osama on 26/03/2021.
//

import Foundation
import UIKit

class DropDownTableView<T>: UIView , UITableViewDelegate , UITableViewDataSource{
    
    var dataSource = [T]()
    var cellIdentifier: String?
    var height: Int = 150
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        return cell
    }
    
    
    
}
