//
//  QuestionDetailView.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/21/24.
//

import SwiftUI
import UIKit
import Combine
import Foundation

struct QuestionDetailView: View {
	@State var selectedOptionId: Int = -1
	@State var showSheet: Bool = false
	@ObservedObject var questionFlowManager: QuestionFlowManager
	@State var buttonSubscriber: AnySubscriber<Algorithm, Never> = AnySubscriber<Algorithm, Never>()
	
	static let invalidOptionId: Int = -1
	@State private var displayingAlertForId: Int = -1
	@State private var displayingAlgo: Algorithm = Algorithm.example

	private var optionSelected: Bool {
		return selectedOptionId != Self.invalidOptionId
	}
	
	private let question: Question
	
	init(_ question: Question, manager: QuestionFlowManager) {
		self.question = question
		self.questionFlowManager = manager

		buttonSubscriber = AnySubscriber<Algorithm, Never>(receiveSubscription: { pass in
			print("Pass? \(pass)")
		}, receiveValue: { algo in
			print("Algo: \(algo)")
			return .unlimited
		}, receiveCompletion: { fail in
			print("Nah")
		})
	}
	
    var body: some View {
		Group {
			GeometryReader { vStack in
				VStack {
					CardView {
						QuestionDetailTitleView(question)
						
						Text(question.description)
							.font(.subheadline)
						
						Text("Example")
							.font(.headline)
							.underline()
						
						Text(question.exampleCode)
							.frame(maxWidth: .infinity, alignment: .leading) // this gives it the same width as it's container, and left aligns it
							.padding()
							.background(.blue)
							.font(.caption.monospaced())
							.cornerRadius(8.0)
							.multilineTextAlignment(.leading)
					}.frame(maxHeight: vStack.size.height * 0.45)
					
					Spacer(minLength: 20.0)
					
					Divider()
						.overlay(Color.gray)
						.padding(.horizontal)
					
					Spacer(minLength: 20.0)
					
					PagingHStack(items: question.algorithmOptions, selectedItem: $selectedOptionId) { item, binding in
						CardViewButtoned(option: item, selectedOptionId: binding)
						.bindTap(to: buttonSubscriber)
//							.receivePassthrough { pass in
//								pass.receive(subscriber: passthroughAlgo)
//							}
					}
					.padding(.horizontal, -20.0)
					.frame(height: vStack.size.height * 0.45)
				}
				
			}
			.padding(EdgeInsets(top: 20.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
			// this .safeAreaInset allows you to place items in.. you guessed it.. the safe area
			.safeAreaInset(edge: .bottom) {
				NavigationLink {
					QuestionDetailView(question, manager: questionFlowManager)
						.onAppear {
							questionFlowManager.incrementStep()
						}.onDisappear {
							questionFlowManager.decrementStep()
						}
				} label: {
					// aparently you need to add the frame to the Text in order for the button's tappable area to match it's size
					Text("Continue")
						.frame(maxWidth: .infinity, maxHeight: 52.0)
						.foregroundStyle(!optionSelected ? Color.disabledButtonForeground : .black)
						.background(!optionSelected ? Color.disabledButtonBackground : Color.listItemBackground)
				}
				.disabled(!optionSelected)
			}
		}
		.navigationTitle(question.title)
		.navigationBarTitleDisplayMode(.inline)
		.onChange(of: selectedOptionId, perform: { val in
			switch questionFlowManager.currentStep {
			case .codeSelection:
				print("Im observing the on change event for code selection")
				questionFlowManager.codeSelection = val
			case .detailSelection:
				print("I'm observing the on change event for detail selection")
				questionFlowManager.detailSelection = val
			case .complexitySelection:
				print("not applicable")
			}
		})
		.onPreferenceChange(AlgorithmCodePresentationKey.self) { value in
			print("Value Changed To: \(value)")
			
			showSheet = value > 0
			if value != displayingAlertForId {
				displayingAlertForId = value
			}
			
		}
		.sheet(isPresented: $showSheet) {
			displayingAlertForId = -1
			showSheet = false
		} content: {
			if displayingAlertForId != -1 {
				Text(question.algorithmOptions[displayingAlertForId].code)
			}
		}
    }
	
}

struct QuestionDetailView_Previews: PreviewProvider {
    static let question = Question.makeExample()
	static var manager = QuestionFlowManager(question)
	
	static var previews: some View {
		NavigationStack {
			QuestionDetailView(question, manager: manager)
		}
    }
}
