//
//  QuestionCard.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import Foundation

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
