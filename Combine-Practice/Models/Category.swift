//
//  Category.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import Foundation

// I may want to add new categories that the app doesn't "know" about, and because it's not critical
// to the completion of an algorithm, maybe a simple id/label/value setup is better
enum Category: String, Codable, Identifiable {
   var id: RawValue { self.rawValue }
   
   case arrays, math, tree,
		recursion,
		greedy, linkedList,
		strings, stacks, queue,
		searching, characters,
		binarySearchTree, binarySearch
   case twoPointer = "two_pointer"
   
   var label: String {
	   switch self {
	   case .arrays:
		   return "Array"
	   case .math:
		   return "Math"
	   case .tree:
		   return "Tree"
	   case .recursion:
		   return "Recursion"
	   case .twoPointer:
		   return "Two pointer"
	   case .greedy:
		   return "Greedy"
	   case .linkedList:
		   return "Linked List"
	   case .strings:
		   return "Strings"
	   case .stacks:
		   return "Stack"
	   case .queue:
		   return "Queues"
	   case .searching:
		   return "Searching"
	   case .characters:
		   return "Characters"
	   case .binarySearchTree:
		   return "Binary Tree"
	   case .binarySearch:
		   return "Binary Search Tree"
	   }
   }
}
