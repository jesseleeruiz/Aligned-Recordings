//
//  TranscriptController.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/27/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation
import CloudKit
import CoreData

class TranscriptController {
    
    // MARK: - Properties
    
    
    // MARK: - Methods
    func createTranscript(with title: String, date: Date, text: String, audioFile: String, context: NSManagedObjectContext) {
        CoreDataStack.shared.save(context: context)
    }
    
    func updateTranscript(transcript: Transcript, with title: String, date: Date, text: String, audioFile: String, context: NSManagedObjectContext) {
        transcript.title = title
        transcript.date = date
        transcript.text = text
        transcript.audioFile = audioFile
        CoreDataStack.shared.save(context: context)
    }
    
    func deleteTranscript(transcript: Transcript, context: NSManagedObjectContext) {
        CoreDataStack.shared.mainContext.delete(transcript)
        CoreDataStack.shared.save(context: context)
    }
}
