//
//  Difficulty.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import Foundation
import SwiftUI

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

extension Difficulty {
	
	var color: Color {
		switch self {
		case .easy: return .easyGreen
		case .medium: return .mediumYellow
		case .hard: return .hardRed
		}
	}
	
}
