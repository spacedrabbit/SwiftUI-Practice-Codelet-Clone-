//
//  UIScrollView+Extension.swift
//  Combine-Practice
//
//  Created by Louis Tur on 1/30/24.
//

import Foundation
import UIKit

// Wow, this feels dirty but it totally works
extension UIScrollView {
	open override var clipsToBounds: Bool {
		get { return false }
		set { }
	}
}

