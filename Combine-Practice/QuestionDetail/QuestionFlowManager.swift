//
//  QuestionFlowManager.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/30/24.
//

import Foundation
import Combine

class QuestionFlowManager: ObservableObject {
	private(set) var question: Question
	
	@Published var codeSelection: Int?
	@Published var detailSelection: Int?
	@Published var timeComplexitySelection: Algorithm.Complexity?
	@Published var spaceComplexitySelecrion: Algorithm.Complexity?
	
	private(set) var currentStep: Step = .codeSelection
	
	enum Step: Int {
		case codeSelection = 0
		case detailSelection
		case complexitySelection
	}
	
	init(_ question: Question) {
		self.question = question
	}
	
	func updateStep(_ step: Step) {
		self.currentStep = step
	}
	
	func incrementStep() {
		guard let newStep = Step(rawValue: currentStep.rawValue + 1) else { return }
		currentStep = newStep
	}
	
	func decrementStep() {
		guard let newStep = Step(rawValue: currentStep.rawValue - 1) else { return }
		currentStep = newStep
	}
}
