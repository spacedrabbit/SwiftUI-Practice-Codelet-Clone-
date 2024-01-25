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
			}

			Spacer(minLength: 20.0)
			
			Divider()
				.overlay(Color.gray)
				.padding(.horizontal)
			
			Spacer(minLength: 20.0)
			
			CardView_V3 {
				HStack {
					Text(question.algorithmOptions[0].title)
					
					Spacer()
					
					Button {
						print("Expand")
					} label: {
						Image(systemName: "arrow.up.left.and.arrow.down.right")
							.padding(4)
							.clipShape(RoundedRectangle(cornerRadius: 4))
							.overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 1))
					}
				}
			
				Text(question.algorithmOptions[0].description)
			}
			
		}
		.padding(EdgeInsets(top: 20.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
		.navigationTitle(question.title)
		.navigationBarTitleDisplayMode(.inline)
    }
}



struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			QuestionDetailView(Question.example)
		}
    }
}
