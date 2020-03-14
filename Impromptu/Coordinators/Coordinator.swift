//
//  Coordinator.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 2/3/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

protocol Coordinator
{
	var children: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start()
}
