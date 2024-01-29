//
//  CardViewButtoned.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/25/24.
//

import SwiftUI

struct CardViewButtoned: View {
	
	@Binding var selectedOptionId: Int
	@State var selected: Bool = false
	let option: Algorithm
	
	init(option: Algorithm, selectedOptionId: Binding<Int>) {
		self.option = option
		self._selectedOptionId = selectedOptionId
	}
	
	var body: some View {
		GeometryReader { context in
			VStack {
				HStack {
					Text(option.title)
					
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
				.padding(.horizontal)
				.frame(width: context.size.width, height: 60.0)
				.background(Rectangle().fill(.white).opacity(0.9))
				.zIndex(4.0)
				
				ScrollView {
					Text(option.code)
						.font(.caption2)
						.monospaced()
				}
				.padding(.horizontal)
				.padding(.vertical, 12.0)
				.zIndex(1.0)
				
				Spacer(minLength: 0.0)
				
				Button {
					if selectedOptionId == option.id {
						selectedOptionId = QuestionDetailView.invalidOptionId
					} else {
						selectedOptionId = option.id
					}
				} label: {
					Text(selectedOptionId == option.id ? "Selected" : "Select")
						.frame(maxWidth: .infinity, maxHeight: 52.0) // aparently you need to add the frame to the Text in order for the button's tappable area to match it's size
						.tint(selectedOptionId == option.id ? .white : .primary)
						
				}
				.background(selectedOptionId == option.id ? .blue : .listItemBackground)
				.zIndex(100.0)
			}
			.background(.white)
			.clipShape(RoundedRectangle(cornerRadius: 8.0))
			.shadow(radius: 4.0)
		}
	}
}


struct CardViewButtoned_Previews: PreviewProvider {
    static var previews: some View {
		VStack(alignment: .leading) {
			CardViewButtoned(option: Algorithm.example, selectedOptionId: .constant(1))
				.frame(maxWidth: .infinity, maxHeight: 300.0)
		}.padding()
		
    }
}
