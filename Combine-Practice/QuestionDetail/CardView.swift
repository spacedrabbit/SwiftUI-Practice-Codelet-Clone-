//
//  CardView.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import SwiftUI

struct CardView<Content: View>: View {
	@ViewBuilder var content: () -> Content
	@State var backgroundColor: Color = .white
	
	var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 20.0) {
				content()
			}
		}
		.cardViewStyle(color: backgroundColor)
	}
}

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
			}
			.frame(maxWidth: .infinity, maxHeight: 52.0)
			.background(.red)
			
		}
		.background(.white)
		.clipShape(RoundedRectangle(cornerRadius: 8.0))
		.shadow(radius: 4.0)
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		VStack(alignment: .center) {
			CardViewButtoned {
				HStack {
					Text("Hi")
					Spacer()
					Text("Hi")
				}
				
				Text("Hi")
			}
			
		}
		.padding()
    }
}
