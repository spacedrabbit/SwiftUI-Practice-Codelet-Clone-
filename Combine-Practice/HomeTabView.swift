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
			NavigationStack {
				QuestionList()
					.toolbar {
						ToolbarItem(placement: .navigationBarLeading) {
							Button() {
								print("add")
							} label: {
								Label("", systemImage: "plus.circle")
							}
						}
						
						ToolbarItem(placement: .navigationBarTrailing) {
							Button {
								print("Filter")
							} label: {
								Label("", systemImage: "line.3.horizontal.decrease")
							}
						}
					}
			}
			.tabItem {
				Label("Question List", systemImage: "list.bullet")
			}
			
			NavigationStack {
				ProfileView()
			}
			.tabItem {
				Label("Profile", systemImage: "person.fill")
			}
			
		}
		
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
