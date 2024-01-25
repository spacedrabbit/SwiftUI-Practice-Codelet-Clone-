//
//  QuestionDetailTitleView.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import SwiftUI

struct QuestionDetailTitleView: View {
	private let question: Question
	
	init(_ question: Question) {
		self.question = question
	}
	
	var body: some View {
		HStack(alignment: .center) {
			Text("\(question.title)")
			Spacer()
			Text("\(question.difficulty.label)")
				.font(.caption)
				   .frame(minWidth: 55.0)
				   .padding(EdgeInsets(top: 4.0, leading: 6.0, bottom: 4.0, trailing: 6.0))
				   .background(color(for: question.difficulty))
				   .cornerRadius(4.0)
		}
		.background()
	}
	
	private func color(for difficulty: Difficulty) -> Color {
		switch difficulty {
		case .easy: return Color(red: 106.0 / 255.0, green: 218.0 / 255.0, blue: 134.0 / 255.0)
		case .medium: return Color(red: 246.0 / 255.0, green: 226.0 / 255.0, blue: 147.0 / 255.0	)
		case .hard: return Color(red: 237.0 / 255.0, green: 130.0 / 255.0, blue: 106.0 / 255.0)
		}
	}
}

struct QuestionDetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
		VStack{
			QuestionDetailTitleView(Question.example)
		}
		.padding()
		.background(.red)
    }
}
