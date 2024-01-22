//
//  Algorithm.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/21/24.
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
}

struct QuestionCard: Codable, Hashable, Identifiable {
	var id: Int {
		return uuid
	}
	
	let uuid: Int
	let questionId: Int
	let title: String
	let difficulty: Difficulty
	let categories: [Category]
	let status: Question.Status
	let approvalScore: Int
	
	enum CodingKeys: String, CodingKey {
		case uuid = "id"
		case questionId, title, difficulty, categories, status, approvalScore
	}
}

extension QuestionCard {
	
	static let example: QuestionCard = QuestionCard(uuid: 0, questionId: 0, title: "Adding Linked Lists", difficulty: .easy, categories: [.math, .linkedList], status: .notStarted, approvalScore: 100)
	
}

struct Algorithm: Codable {
	let id: Int
	let title: String
	let description: String
	let code: String
	let timeComplexity: Complexity
	let spaceComplexity: Complexity
	let categories: [Category]
	
	// May make this a simple struct instead. for example I might want to include m * n complexity at some point
	enum Complexity: String, Codable {
		case constant, logarithmic, linear,
			quasilinear, quadratic, exponential
	}
}
 
// I may want to add new categories that the app doesn't "know" about, and because it's not critical
// to the completion of an algorithm, maybe a simple id/label/value setup is better
enum Category: String, Codable, Identifiable {
	var id: RawValue { self.rawValue }
	
	case arrays, math, tree,
		 recursion,
		 greedy, linkedList,
		 strings, stacks, queue,
		 searching, characters,
		 binarySearchTree, binarySearch
	case twoPointer = "two_pointer"
	
	var label: String {
		switch self {
		case .arrays:
			return "Array"
		case .math:
			return "Math"
		case .tree:
			return "Tree"
		case .recursion:
			return "Recursion"
		case .twoPointer:
			return "Two pointer"
		case .greedy:
			return "Greedy"
		case .linkedList:
			return "Linked List"
		case .strings:
			return "Strings"
		case .stacks:
			return "Stack"
		case .queue:
			return "Queues"
		case .searching:
			return "Searching"
		case .characters:
			return "Characters"
		case .binarySearchTree:
			return "Binary Tree"
		case .binarySearch:
			return "Binary Search Tree"
		}
	}
}

enum Difficulty: String, Codable {
	case easy, medium, hard
	
	var label: String {
		switch self {
		case .easy: return "Easy"
		case .medium: return "Medium"
		case .hard: return "Hard"
		}
	}

}



