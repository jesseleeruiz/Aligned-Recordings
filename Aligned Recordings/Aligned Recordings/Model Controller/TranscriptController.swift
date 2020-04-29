//
//  TranscriptController.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/27/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import Foundation
import PDFKit
import CoreData

class TranscriptController {
    
    // MARK: - Properties
    var transcript = Transcript()
    
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
    
    func createPDF() -> Data {
        let pdfMetaData = [
            kCGPDFContextCreator: "Aligned Recordings",
            kCGPDFContextAuthor: "jesseruiz.com",
            kCGPDFContextTitle: transcript.title
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11.0 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { (context) in
            context.beginPage()
            
            let titleBottom = configureTitle(pageRect: pageRect)
            configureBodyText(pageRect: pageRect, textTop: titleBottom + 18.0)
        }
        
        return data
    }
    
    func configureTitle(pageRect: CGRect) -> CGFloat {
        let titleFont = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont]
        let attributedTitle = NSAttributedString(string: transcript.title ?? "", attributes: titleAttributes)
        let titleStringSize = attributedTitle.size()
        let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0, y: 36, width: titleStringSize.width, height: titleStringSize.height)
        attributedTitle.draw(in: titleStringRect)
        return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    func configureBodyText(pageRect: CGRect, textTop: CGFloat) {
        let textFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .natural
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        let textAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
        ]
        let attributedText = NSAttributedString(string: transcript.text ?? "", attributes: textAttributes)
        let textRect = CGRect(x: 10, y: textTop, width: pageRect.width - 20, height: pageRect.height - textTop - pageRect.height / 5.0)
        attributedText.draw(in: textRect)
    }
 }
