//
//  TwitterChildViewController.swift
//  Twitter
//
//  Created by Merrick Sapsford on 21/03/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit

class TwitterChildViewController: UIViewController {
    
    var pageTitle: String? {
        didSet {
            self.titleLabel?.text = pageTitle
        }
    }

    @IBOutlet weak var titleLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel?.text = self.pageTitle
    }
}
