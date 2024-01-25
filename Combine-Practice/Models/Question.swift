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
	
	init(uuid: Int, title: String, description: String, exampleCode: String, difficulty: Difficulty, categories: [Category] = [], algoOptions: [Algorithm], correctAnswer: Int, status: Status = .notStarted) {
		self.id = uuid
		self.title = title
		self.description = description
		self.exampleCode = exampleCode
		self.difficulty = difficulty
		self.categories = categories
		self.algorithmOptions = algoOptions
		self.correctAnswer = correctAnswer
		self.status = status
	}
}

extension Question {
	
	static let example = Question(uuid: 0,
								  title: "Palindrome Strings",
								  description: "When a string does not change whether it's written backward or forward, it's considered to be a palindrome.\nGiven a string s, return true if the string is the same when written backward. Choose the optimal solution.",
								  exampleCode: "1)s = 'Apple', returns false\n2)s = 'level', returns true",
								  difficulty: .easy,
								  categories: [.strings, .twoPointer],
								  algoOptions: [Algorithm.example, Algorithm.example, Algorithm.example],
								  correctAnswer: 0, status: .notStarted)

	static func makeExample() -> Question {
		return Question(uuid: UUID().hashValue,
						title: "Palindrome Strings",
						description: "When a string does not change whether it's written backward or forward, it's considered to be a palindrome.\nGiven a string s, return true if the string is the same when written backward. Choose the optimal solution.",
						exampleCode: "1)s = 'Apple', returns false\n2)s = 'level', returns true",
						difficulty: .easy,
						categories: [.strings, .twoPointer],
						algoOptions: [Algorithm.example, Algorithm.example, Algorithm.example],
						correctAnswer: 0, status: .notStarted)
	}
	
}
