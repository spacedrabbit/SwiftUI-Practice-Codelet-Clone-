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
 
