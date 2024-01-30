//
//  PagingHStack.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/29/24.
//

import SwiftUI

struct PagingHStack: View {
	@State private var currentIndex = 1
	@GestureState private var dragOffset: CGFloat = 0.0
	private var colors = [Color.red, Color.yellow, Color.green, Color.blue]
	
    var body: some View {
		GeometryReader { outerContext in
			HStack(spacing: 0) {
				ForEach(colors.indices, id: \.self) { colorIdx in
					
					GeometryReader { innerContext in
						colors[colorIdx]
					}
					.padding(.horizontal, 20)
					.frame(width: outerContext.size.width, height: colorIdx == currentIndex ? 450 : 400)
					.opacity(colorIdx == currentIndex ? 1.0 : 0.7)
				}
			}
			.frame(width: outerContext.size.width, height: outerContext.size.height, alignment: .leading)
			.offset(x: -CGFloat(currentIndex) * outerContext.size.width)
			.offset(x: self.dragOffset)
			.gesture(
				DragGesture()
					.updating(self.$dragOffset, body: { value, state, transaction in
						state = value.translation.width
					})
					.onEnded ({ value in
						let threshold = outerContext.size.width * 0.65
						var newIndex = Int(-value.translation.width / threshold) + self.currentIndex
						newIndex = min(max(newIndex, 0), 3) // 3 is the size of the colors array - 1
						self.currentIndex = newIndex
					})
			)
		}.animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3), value: dragOffset)
    }
}

struct PagingHStack_Previews: PreviewProvider {
    static var previews: some View {
        PagingHStack()
    }
}
