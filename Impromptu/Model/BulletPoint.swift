//
//  BulletPoint.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 8/3/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit


class BulletPoint
{
	var explanation: String
	var example: String?
	
	init(_ explanation: String)
	{ self.explanation = explanation }
}

struct BulletPointList
{
	private var maxPoints = 3
	private(set) var points = [BulletPoint]()
}

// Conforming to Collection
extension BulletPointList: Collection
{
	typealias Index = Array<BulletPoint>.Index
	typealias Element = Array<BulletPoint>.Element
	
	var startIndex: Index { points.startIndex }
	var endIndex: Index { points.endIndex }
	
	subscript(index: Index) -> Iterator.Element
	{ get { points[index] } }
	
	func index(after i: Index) -> Index
	{ points.index(after: i) }
}

// So we can create it like: let list = [bulletPoint1, bulletPoint2]
extension BulletPointList: ExpressibleByArrayLiteral
{
	typealias ArrayLiteralElement = Array<BulletPoint>.Element
	
	init(arrayLiteral elements: Array<BulletPoint>.Element...)
	{ for item in elements { points.append(item) } }
}

// Ancillary functions
extension BulletPointList
{
	/***
	Appends a bullet point item to the list.
	It only allows 3 items in the list. If a fourth item is added,
	the first item of the list is removed.
	*/
	mutating func append(_ point: BulletPoint)
	{
		if points.count == maxPoints { points.removeFirst() }
		points.append(point)
	}
	
	mutating func remove(at: Int) -> BulletPoint
	{ points.remove(at: 0) }
	
	mutating func removeAll()
	{ points.removeAll() }
}
