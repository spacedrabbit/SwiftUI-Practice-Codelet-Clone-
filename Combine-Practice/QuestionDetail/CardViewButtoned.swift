//
//  CardViewButtoned.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/25/24.
//

import SwiftUI

struct CardViewButtoned<Content: View>: View {
	@ViewBuilder var content: () -> Content
	@State var selected: Bool = false
	let option: Algorithm
	
//	init(_ option: Algorithm) {
//		self.option = option
//	}
	
	var body: some View {
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
			.frame(width: .infinity, height: 60.0)
			.padding(.horizontal)
			.background(Rectangle().fill(.red).opacity(0.25))
			.zIndex(1.0)
			
			content()
				.padding(.horizontal)
				.padding(.vertical, 12.0)
				.zIndex(0.1)
			
			Spacer(minLength: 0.0)
			
			Button {
				selected.toggle()
			} label: {
				Text(selected ? "Selected" : "Select")
					.frame(maxWidth: .infinity, maxHeight: 52.0) // aparently you need to add the frame to the Text in order for the button's tappable area to match it's size
					.tint(selected ? .white : .primary)
			}
			.background(selected ? .blue : .listItemBackground)
		}
		.background(.white)
		.clipShape(RoundedRectangle(cornerRadius: 8.0))
		.shadow(radius: 4.0)
	}
}


struct CardViewButtoned_Previews: PreviewProvider {
    static var previews: some View {
		VStack(alignment: .leading) {
			CardViewButtoned(content: {
				Text("Sample")
			}, option: Algorithm.example)
		}.padding()
		
    }
}
