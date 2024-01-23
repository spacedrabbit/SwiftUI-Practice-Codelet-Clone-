//
//  QuestionDetailView.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/21/24.
//

import SwiftUI

struct QuestionDetailView: View {
	private let question: Question
	
	init(_ question: Question) {
		self.question = question
	}
	
    var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 20.0) {
				QuestionDetailTitleView(question)
				
				Text(question.description)
					.font(.subheadline)
				
				Text("Example")
					.font(.headline)
					.underline()
				
				Text(question.exampleCode)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding()
					.background(.blue)
					.font(.caption.monospaced())
					.cornerRadius(8.0)
					.multilineTextAlignment(.leading)
					
			}
			.cardViewStyle(color: .red)
			
			Spacer(minLength: 20.0)
			
			Divider()
				.overlay(Color.gray)
				.padding(.horizontal)
			
			Spacer()
			
			VStack {
				HStack {
					Text(question.algorithmOptions[0].title)
					
					Spacer()
					
					Image(systemName: "arrow.up.left.and.arrow.down.right")
						.padding(4)
						.clipShape(RoundedRectangle(cornerRadius: 4))
						.overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 1))
				}
			}
			
		}
		.padding(EdgeInsets(top: 20.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
		.navigationTitle(question.title)
		.navigationBarTitleDisplayMode(.inline)
    }
}

extension View {
	
	func cardViewStyle(color: Color? = nil) -> some View {
		modifier(CardViewModifier(color: color))
	}
	
}

struct CardViewModifier: ViewModifier {
	private var color: Color
	
	init(color: Color? = nil) {
		self.color = color ?? .white
	}
	
	func body(content: Content) -> some View {
		content
			.padding()
			.background(color)
			.cornerRadius(8.0)
			.shadow(radius: 4.0, x: 0, y: 3)
	}
}

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



struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			QuestionDetailView(Question.example)
		}
    }
}
