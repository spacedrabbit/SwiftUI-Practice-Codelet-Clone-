//
//  Combine_PracticeApp.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/14/24.
//

import SwiftUI

@main
struct Combine_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
			let _ = print(JustThreeInts.snatch())
			let _ = print(JustThreeInts.snatch())
			let _ = print(JustThreeInts.snatch())
			let _ = print(JustThreeInts.snatch())
            HomeTabView()
        }
    }
}
