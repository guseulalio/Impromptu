//
//  SpeechTypeList.swift
//  Impromptu
//
//  Created by Gustavo E M Cabral on 8/3/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import Foundation


enum SpeechType
{ case inspirational, motivational, educational, informational, demonstrable, entertaining, specialEvent, persuasive }

struct SpeechTypeList
{
	private var maxTypes = 2
	private(set) var types = [SpeechType]()
}

// Conforming to Collection
extension SpeechTypeList: Collection
{
	typealias Index = Array<SpeechType>.Index
	typealias Element = Array<SpeechType>.Element
	
	var startIndex: Index { types.startIndex }
	var endIndex: Index { types.endIndex }
	
	subscript(index: Index) -> Iterator.Element
	{ get { types[index] } }
	
	func index(after i: Index) -> Index
	{ types.index(after: i) }
}

// So we can create it like: let list = [speechType1, speechType2]
extension SpeechTypeList: ExpressibleByArrayLiteral
{
	typealias ArrayLiteralElement = Array<SpeechType>.Element
	
	init(arrayLiteral elements: Array<SpeechType>.Element...)
	{ for item in elements { types.append(item) } }
}

// Ancillary functions
extension SpeechTypeList
{
	/***
	Appends a speech type item to the list.
	It only allows 3 items in the list. If a fourth item is added,
	the first item of the list is removed.
	*/
	mutating func append(_ type: SpeechType)
	{
		if types.count == maxTypes { types.removeFirst() }
		types.append(type)
	}
	
	mutating func remove(at: Int) -> SpeechType
	{ types.remove(at: 0) }
	
	mutating func removeAll()
	{ types.removeAll() }
}
