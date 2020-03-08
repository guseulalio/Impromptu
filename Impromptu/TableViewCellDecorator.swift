//
//  TableViewCellDecorator.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 8/3/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

protocol TableViewCellDecorator
{
	func cell(forRowAt indexPath: IndexPath, of tableView: UITableView, label: String) -> UITableViewCell
	func cell(forRowAt indexPath: IndexPath, of tableView: UITableView, data: [String: Any]?) -> UITableViewCell
}

extension TableViewCellDecorator
{
	func cell(forRowAt indexPath: IndexPath, of tableView: UITableView, label: String) -> UITableViewCell
	{
		return UITableViewCell()
	}
	func cell(forRowAt indexPath: IndexPath, of tableView: UITableView, data: [String: Any]?) -> UITableViewCell
	{
		return UITableViewCell()
	}
}
