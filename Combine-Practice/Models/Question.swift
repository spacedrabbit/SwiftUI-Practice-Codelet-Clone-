//
//  Question.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import Foundation

struct Question: Codable {
	let id: Int
	let title: String
	let description: String
	let exampleCode: String
	
	let difficulty: Difficulty
	let categories: [Category]
	
	let algorithmOptions: [Algorithm]
	let correctAnswer: Int
	
	let status: Status
	
	enum Status: String, Codable {
		case notStarted = "not_started", successful, inProgress, unSuccessful
	}
	
	init() {
		id = -1
		title = ""
		description = ""
		exampleCode = ""
		difficulty = .easy
		categories = []
		algorithmOptions = []
		correctAnswer = -1
		status = .notStarted
	}
}
