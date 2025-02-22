//
//  OpenInBrowserActivity.swift
//  NetNewsWire-iOS
//
//  Created by Maurice Parker on 1/9/20.
//  Copyright © 2020 Ranchero Software. All rights reserved.
//

import UIKit

class OpenInBrowserActivity: UIActivity {
	
	private var activityItems: [Any]?

	override var activityTitle: String? {
		return NSLocalizedString("activity.title.open-in-browser", comment: "Open in Browser")
	}
	
	override var activityImage: UIImage? {
		return AppAssets.safariImage
	}
	
	override var activityType: UIActivity.ActivityType? {
		return UIActivity.ActivityType(rawValue: "com.rancharo.NetNewsWire-Evergreen.safari")
	}

	override class var activityCategory: UIActivity.Category {
		return .action
	}
	
	override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
		return true
	}
	
	override func prepare(withActivityItems activityItems: [Any]) {
		self.activityItems = activityItems
	}
	
	override func perform() {
		guard let url = activityItems?.first(where: { $0 is URL }) as? URL else {
			activityDidFinish(false)
			return
		}
		
		UIApplication.shared.open(url, options: [:], completionHandler: nil)
		activityDidFinish(true)
	}
	
}
