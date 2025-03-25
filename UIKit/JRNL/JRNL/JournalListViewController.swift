//
//  ViewController.swift
//  JRNL
//
//  Created by 존진 on 3/25/25.
//

import UIKit

class JournalListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindNewEntryCancel(segue: UIStoryboardSegue) {
        print("unwindNewEntryCancel")
    }
}

extension JournalListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
    }
}
