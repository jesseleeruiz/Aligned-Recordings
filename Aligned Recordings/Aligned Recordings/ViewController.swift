//
//  ViewController.swift
//  Aligned Recordings
//
//  Created by Jesse Ruiz on 4/24/20.
//  Copyright © 2020 Jesse Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Transcript", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
