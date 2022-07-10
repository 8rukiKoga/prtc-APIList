//
//  DetailViewController.swift
//  List
//
//  Created by 古賀遥貴 on 2022/07/09.
//

import UIKit

class DetailViewController: UIViewController {

    var passedText: String?
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = passedText
    }
}
