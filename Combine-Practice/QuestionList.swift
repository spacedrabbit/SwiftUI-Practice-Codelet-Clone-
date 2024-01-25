//
//  QuestionList.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/21/24.
//

import SwiftUI

struct QuestionListView: View {
	private let questionCards: [QuestionCard] = Bundle.main.decode([QuestionCard].self, from: "question_cards.json")
	private let questions: [Question] = Bundle.main.decode([Question].self, from: "questions.json")
	
	@State private var addQuestionAlertVisible = false
	
    var body: some View {
			List(questionCards) { card in
				Section() {
					NavigationLink(value: card) {
						QuestionRow(questionCard: card)
					}
				}
			}
			.navigationTitle("Question List")
			.navigationBarTitleDisplayMode(.inline)
			.navigationDestination(for: QuestionCard.self) { card in
				let idx = questions.firstIndex(where: { $0.id == card.questionId }) ?? 0
				QuestionDetailView(questions[idx])
					.toolbar(.hidden, for: .tabBar)
			}
	}
	
	
	
}

struct QuestionRow: View {
	let questionCard: QuestionCard
	
	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(questionCard.title).font(.callout)
				
				Spacer()
				
				HStack(spacing: 8.0) {
					ForEach(questionCard.categories) { category in
						Text(category.label)
							.font(.caption)
							.padding(EdgeInsets(top: 4.0, leading: 6.0, bottom: 4.0, trailing: 6.0))
							.background(Color(red: 237.0 / 255.0, green: 237.0 / 255.0, blue: 237.0 / 255.0))
							.cornerRadius(4.0)
					}
				}
				
			}
			
			Spacer()
			
			VStack(alignment: .trailing) {
				Text(questionCard.difficulty.label)
					.font(.caption)
					.frame(minWidth: 55.0)
					.padding(EdgeInsets(top: 4.0, leading: 6.0, bottom: 4.0, trailing: 6.0))
					.background(color(for: questionCard.difficulty))
					.cornerRadius(4.0)
					
				Spacer()
				
				Label("\(questionCard.approvalScore)%", systemImage: "hand.thumbsup")
					.labelStyle(ImageLastLabelStyle())
					
			}
		}
		.padding(.vertical, 10)
		
	}
	
	private func color(for difficulty: Difficulty) -> Color {
		switch difficulty {
		case .easy: return Color(red: 106.0 / 255.0, green: 218.0 / 255.0, blue: 134.0 / 255.0)
		case .medium: return Color(red: 246.0 / 255.0, green: 226.0 / 255.0, blue: 147.0 / 255.0	)
		case .hard: return Color(red: 237.0 / 255.0, green: 130.0 / 255.0, blue: 106.0 / 255.0)
		}
	}
	
}

struct ImageLastLabelStyle: LabelStyle {
	
	func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.title
				.padding(.trailing, 4)
			configuration.icon
		}
		.font(.callout)
		.foregroundColor(.black)
	}
	
}

struct QuestionList_Previews: PreviewProvider {
	
	static var previews: some View {
		TabView {
			NavigationStack {
				QuestionListView()
			}
		}
		.tabItem {
			Label("Question List", systemImage: "list.bullet")
			
		}
    }
}
