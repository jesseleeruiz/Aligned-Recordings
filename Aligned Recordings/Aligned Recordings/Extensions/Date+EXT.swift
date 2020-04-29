//
//  Date+EXT.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/29/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
