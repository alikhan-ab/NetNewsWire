//
//  FeedlyFeedsSearchResponse.swift
//  Account
//
//  Created by Kiel Gillard on 1/12/19.
//  Copyright © 2019 Ranchero Software, LLC. All rights reserved.
//

import Foundation

struct FeedlyFeedsSearchResponse: Decodable {
	
	struct Feed: Decodable {
		var title: String
		var feedId: String
	}
	
	var results: [Feed]
}
