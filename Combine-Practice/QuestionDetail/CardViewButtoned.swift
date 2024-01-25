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
	
	var body: some View {
		VStack {
			content()
				.padding(.horizontal)
				.padding(.vertical, 12.0)
			
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
			CardViewButtoned {
				Text("Sample")
			}
		}.padding()
		
    }
}
