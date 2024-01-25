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

struct CardView_V2<Content: View>: View {
	@ViewBuilder var content: () -> Content
	
	var body: some View {
		GeometryReader { d in
			VStack(alignment: .leading) {
				content()
				
				HStack {
					Button {
						
					} label: {
						Text("Select")
					}
					.frame(width: d.frame(in: .local).width, height: 44.0)
					.background(.yellow)
				}
				.frame(width: d.size.width, height: 44.0)
				.background(.green)
			}
			
		}.cardViewStyle()
		
	}
}

struct CardView_V3<Content: View>: View {
	@ViewBuilder var content: () -> Content
	@State var selected: Bool = false
	
	var body: some View {
		VStack {
			content()
				.padding(.horizontal)
				.padding(.vertical, 12.0)
			
			
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

struct CardViewButtoned<Content: View>: View {
	@ViewBuilder var content: () -> Content
	@State var backgroundColor: Color = .white
	
	var body: some View {
		ZStack {
			VStack(alignment: .leading, spacing: 20.0) {
				content()
				Spacer(minLength: 44.0)
			}
			
			Button {
				print("Tapped")
			} label: {
				Text("Select")
			}
			.frame(height: 44.0)
			.background(.red)
			.alignmentGuide(HorizontalAlignment.center, computeValue: { d in
				d[.bottom]
			})
			.zIndex(1)
			
			
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
			CardView_V3 {
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
