//
//  ViewController.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/24/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var array: [String] = ["Meet with Jen", "Conference Call", "1:1 with Tyler"]
    var transcripts = [CKRecord]()
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var importButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func importButtonPressed(_ sender: UIButton) {
        
    }
    
    // MARK: - Methods
    private func updateViews() {
        recordButton.layer.cornerRadius = 16
        importButton.layer.cornerRadius = 16
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Transcript", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

