//
//  QuestionDetailView.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/21/24.
//

import SwiftUI
import UIKit

// Wow, this feels dirty but it totally works
extension UIScrollView {
	open override var clipsToBounds: Bool {
		get { return false }
		set { }
	}
}

struct QuestionDetailView: View {
	private let question: Question
	
	init(_ question: Question) {
		self.question = question
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
					
					ScrollView(.horizontal) {
						LazyHStack(spacing: 12.0) {
							
							Color.clear.frame(width: 1.0)
							
							ForEach(question.algorithmOptions) { option in
								
								CardViewButtoned(content: {
									
									ScrollView {
										Text(option.code)
									}
									
								}, option: option)
								.frame(minWidth: vStack.frame(in: .global).width, maxWidth: vStack.frame(in: .global).width, minHeight: vStack.size.height * 0.45)
								
							}
							
							Color.clear.frame(width: 1.0) // Gives the effect of contentInset, just enough to align the views considering the shadows
							
						}
						.padding(.horizontal, -14.0)
					}
					.frame(width: vStack.size.width, height: vStack.size.height * 0.45)
					.scrollIndicators(.hidden)
					
				}
				
			}
			
		}
		.padding(EdgeInsets(top: 20.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
		.navigationTitle(question.title)
		.navigationBarTitleDisplayMode(.inline)
		
    }
}



struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
			QuestionDetailView(Question.makeExample())
    }
}
