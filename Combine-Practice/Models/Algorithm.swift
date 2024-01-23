//
//  Algorithm.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/21/24.
//

import Foundation


struct Algorithm: Codable {
	let id: Int
	let title: String
	let description: String
	let code: String
	let timeComplexity: Complexity
	let spaceComplexity: Complexity
	let categories: [Category]
	
	// May make this a simple struct instead. for example I might want to include m * n complexity at some point
	enum Complexity: String, Codable {
		case constant, logarithmic, linear,
			quasilinear, quadratic, exponential
	}
}

extension Algorithm {
	
	static let example = Algorithm(id: 0, title: "Approach 0", description: "Use two pointers, one at the first index of the string and one at the end. Compare the values at both pointers. If they are not equal, return false. Increase the first pointer and decrease the second pointer. When the first pointer is greater than the second pointer, return true", code: "", timeComplexity: .linear, spaceComplexity: .constant, categories: [.twoPointer, .strings])
}
 
