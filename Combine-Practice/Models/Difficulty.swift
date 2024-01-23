//
//  Difficulty.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import Foundation

enum Difficulty: String, Codable {
   case easy, medium, hard
   
   var label: String {
	   switch self {
	   case .easy: return "Easy"
	   case .medium: return "Medium"
	   case .hard: return "Hard"
	   }
   }

}
