//
//  HomeTabView.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/21/24.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        
		TabView {
			QuestionList().tabItem {
				Label("Question List", systemImage: "list.bullet")
			}
			
			ProfileView().tabItem {
				Label("Profile", systemImage: "person.fill")
			}
		}
		
    }
}

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

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
