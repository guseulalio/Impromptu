//
//  ViewController.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 29/2/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded, UITableViewDelegate, TableViewCellDecorator
{
	weak var coordinator: MasterCoordinator?
	@IBOutlet var speechTable: UITableView!
	@IBOutlet var listTypeSwitch: UISegmentedControl!
	
	var unfinishedSpeeches: SpeechList!
	var finishedSpeeches: SpeechList!
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		speechTable.delegate = self
		speechTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		unfinishedSpeeches = SpeechList()
		finishedSpeeches = SpeechList()
		unfinishedSpeeches.cellDecorator = self
		finishedSpeeches.cellDecorator = self
		
		speechTable.dataSource = unfinishedSpeeches
		
		speechTable.layer.borderColor = UIColor.systemOrange.cgColor
		speechTable.layer.borderWidth = 3
		
		let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
								  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)]
		let unselectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
									NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)]
		listTypeSwitch.setTitleTextAttributes(selectedAttributes, for: .selected)
		listTypeSwitch.setTitleTextAttributes(unselectedAttributes, for: .normal)
		
		populateSpeeches()
	}
	
	// populating with fake boilerplate text.
	// @TODO Remove
	func populateSpeeches()
	{
		for _ in 1...40
		{
			if Bool.random()
			{ unfinishedSpeeches.add(Speech(with: Lorem.sentence)) }
			else
			{ finishedSpeeches.add(Speech(with: Lorem.sentence)) }
		}
	}
	
	func cell(forRowAt indexPath: IndexPath, of tableView: UITableView, label: String) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = label
		return cell
	}
	
	@IBAction func listTypeSwitched(_ sender: Any)
	{
		if listTypeSwitch.selectedSegmentIndex == 0
		{ speechTable.dataSource = unfinishedSpeeches }
		else
		{ speechTable.dataSource = finishedSpeeches }
		
		speechTable.reloadData()
	}
}

