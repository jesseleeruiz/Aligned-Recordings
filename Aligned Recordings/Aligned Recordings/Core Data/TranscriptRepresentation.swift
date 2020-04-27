//
//  TranscriptRepresentation.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/26/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation

struct TranscriptRepresentation: Codable {
    let title: String
    let date: Date
    let transcriptid: UUID
    let text: String
    let audioFile: String
}
