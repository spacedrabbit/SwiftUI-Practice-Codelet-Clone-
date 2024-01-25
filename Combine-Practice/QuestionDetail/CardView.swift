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
			ScrollView {
				VStack(alignment: .leading, spacing: 20.0) {
					content()
				}
			}
		}
		.cardViewStyle(color: backgroundColor)
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
			CardView {
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
