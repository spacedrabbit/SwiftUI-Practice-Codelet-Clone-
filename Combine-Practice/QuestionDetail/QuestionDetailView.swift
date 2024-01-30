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
	
	static let invalidOptionId: Int = -1

	private var optionSelected: Bool {
		return selectedOptionId != Self.invalidOptionId
	}
	
	private let question: Question
	
	init(_ question: Question, manager: QuestionFlowManager) {
		self.question = question
		self.questionFlowManager = manager
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
				} label: {
					// aparently you need to add the frame to the Text in order for the button's tappable area to match it's size
					Text("Continue")
						.frame(maxWidth: .infinity, maxHeight: 52.0)
						.foregroundStyle(!optionSelected ? Color.disabledButtonForeground : .black)
						.background(!optionSelected ? Color.disabledButtonBackground : Color.listItemBackground)
				}.disabled(!optionSelected)
			}
		}
		.navigationTitle(question.title)
		.navigationBarTitleDisplayMode(.inline)
		.sheet(isPresented: $showSheet) {
			showSheet = false
		} content: {
			Text("Kayyy")
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
