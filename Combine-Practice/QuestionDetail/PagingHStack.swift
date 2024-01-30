//
//  PagingHStack.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/29/24.
//

import SwiftUI

struct PagingHStack<Content: ConfiguredView, Item: Identifiable>: View {
	@ViewBuilder var content: (Item, Binding<Item.ID>) -> Content
	@State private var currentIndex = 0
	@GestureState private var dragOffset: CGFloat = 0.0
	@Binding var selectedItem: Item.ID
	
	private var items: [Item]

	init(items: [Item], selectedItem: Binding<Item.ID>, content: @escaping (Item, Binding<Item.ID>) -> Content) {
		self.content = content
		self.items = items
		self._selectedItem = selectedItem
	}
	
    var body: some View {
		GeometryReader { outerContext in
			HStack(spacing: 0) {
				ForEach(items.indices, id: \.self) { idx in
					GeometryReader { innerContext in
						content(items[idx], $selectedItem)
					}
					.padding(.horizontal, 20)
					.frame(width: outerContext.size.width)
				}
			}
			.frame(width: outerContext.size.width, height: outerContext.size.height, alignment: .leading)
			.offset(x: -CGFloat(currentIndex) * outerContext.size.width)
			.offset(x: self.dragOffset)
			.gesture(
				DragGesture()
					.updating(self.$dragOffset, body: { value, state, transaction in
						print(dragOffset)
						state = value.translation.width
					})
					.onEnded ({ value in
						let threshold = outerContext.size.width * 0.65
						var newIndex = Int(-value.translation.width / threshold) + self.currentIndex
						newIndex = min(max(newIndex, 0), items.count - 1) // 3 is the size of the colors array - 1
						self.currentIndex = newIndex
					})
			)
		}.animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3), value: dragOffset)
    }
}

struct PagingHStack_Previews: PreviewProvider {
	@State static var sample: Int = -1
	
    static var previews: some View {
		PagingHStack(items: Question.makeExample().algorithmOptions, selectedItem: $sample) { algo, binding  in
			CardViewButtoned(option: algo, selectedOptionId: binding)
		}
    }
}
