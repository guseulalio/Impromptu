//
//  Storyboarded.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 2/3/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

protocol Storyboarded
{
	static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController
{
	static func instantiate() -> Self
	{
		let id = String(describing: self)
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let vc = storyboard.instantiateViewController(identifier: id) as? Self else
			{ fatalError("No item in storyboard with ID \(id).") }
		return vc
	}
	
	static func instantiate(withID id: String) -> Self
	{
		//let id = String(describing: self)
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let vc = storyboard.instantiateViewController(identifier: id) as? Self else
		{ fatalError("No item in storyboard with ID \(id).") }
		return vc
	}
}
