//
//  Bundle+Extensions.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/23/24.
//

import Foundation

extension Bundle {
	
	func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to load \(file) from bundle.")
		}
		
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		do {
			let loaded = try decoder.decode(T.self, from: data)
		} catch (let error) {
			print(error)
		}
		
		guard let loaded = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to decode \(file) from bundle.")
		}
		
		return loaded
	}
	
}
