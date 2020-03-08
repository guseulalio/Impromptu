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
		
		speechTable.layer.cornerRadius = 16
		speechTable.layer.borderColor = UIColor.systemOrange.cgColor
		speechTable.layer.borderWidth = 3
		
		populateSpeeches()
	}
	
	// populating with fake boilerplate text.
	func populateSpeeches()
	{
		for i in 1...30
		{
			if Bool.random()
			{ unfinishedSpeeches.add(Speech(with: "This is unfinished speech number \(i). There's a lot to do here.")) }
			finishedSpeeches.add(Speech(with: "This is speech number \(i*100). It's done and ready to be delivered."))
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

