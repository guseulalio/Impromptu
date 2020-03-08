//
//  Speech.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 8/3/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit


class Speech
{
	var topic: String
	var types: SpeechTypeList = SpeechTypeList()
	var bulletPoints: BulletPointList = BulletPointList()
	var summary: String?
	var callToAction: String?
	var intro: String?
	var title: String?
	
	init(with topic: String)
	{ self.topic = topic }
}


class SpeechList: NSObject, TableViewCellDecorator
{
	private var speeches = [Speech]()
	
	lazy var cellDecorator: TableViewCellDecorator = self
	
	func add(_ speech: Speech)
	{ speeches.append(speech) }
	
	func remove(at index: Int) -> Speech
	{ return speeches.remove(at: index) }
}

extension SpeechList: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{ speeches.count }
	//{ 10 }
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		return cellDecorator.cell(forRowAt: indexPath, of: tableView, label: speeches[indexPath.row].topic)
		//return cellDecorator.cell(forRowAt: indexPath, of: tableView, label: "This is some text. It is here just to make some content.")
	}
}
