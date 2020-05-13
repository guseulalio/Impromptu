//
//  MasterCoordinator.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 2/3/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class MasterCoordinator: Coordinator
{
	var children = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController)
		{ self.navigationController = navigationController }
	
	func start()
	{
		let vc = ViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}
}
