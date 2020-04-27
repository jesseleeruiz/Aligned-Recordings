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
            let transcriptid = transcriptid,
            let text = text,
            let audioFile = audioFile else { return nil }
        return TranscriptRepresentation(title: title, date: date, transcriptid: transcriptid, text: text, audioFile: audioFile)
    }
    
    @discardableResult convenience init(title: String,
                                        date: Date = Date.init(timeIntervalSinceNow: 0),
                                        transcriptid: UUID = UUID(),
                                        text: String,
                                        audioFile: String,
                                        context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.date = date
        self.transcriptid = transcriptid
        self.text = text
        self.audioFile = audioFile
    }
    
    @discardableResult convenience init?(transcriptRepresentation: TranscriptRepresentation, context: NSManagedObjectContext) {
        self.init(title: transcriptRepresentation.title,
                  date: transcriptRepresentation.date,
                  transcriptid: transcriptRepresentation.transcriptid,
                  text: transcriptRepresentation.text,
                  audioFile: transcriptRepresentation.audioFile,
                  context: context)
    }
}
