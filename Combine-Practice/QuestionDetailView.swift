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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(Question())
    }
}
