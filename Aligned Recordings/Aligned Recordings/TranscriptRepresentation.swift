//
//  TranscriptRepresentation.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/26/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

struct TranscriptRepresentation: Codable {
    var title: String
    var date: Date
    var text: String
    var audioFile: String
}
