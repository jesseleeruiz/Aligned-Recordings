//
//  Transcript+Convenience.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/26/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation
import CoreData

extension Transcript {
    var transcriptRepresentation: TranscriptRepresentation? {
        guard let title = title,
            let date = date,
            let text = text,
            let audioFile = audioFile else { return nil }
        return TranscriptRepresentation(title: title, date: date, text: text, audioFile: audioFile)
    }
    
    @discardableResult convenience init(title: String,
                                        date: String,
                                        text: String,
                                        audioFile: String,
                                        context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.date = date
        self.text = text
        self.audioFile = audioFile
    }
    
    @discardableResult convenience init?(transcriptRepresentation: TranscriptRepresentation, context: NSManagedObjectContext) {
        self.init(title: transcriptRepresentation.title,
                  date: transcriptRepresentation.date,
                  text: transcriptRepresentation.text,
                  audioFile: transcriptRepresentation.audioFile,
                  context: context)
    }
}
