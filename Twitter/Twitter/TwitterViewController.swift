//
//  TwitterViewController.swift
//  Twitter
//
//  Created by Merrick Sapsford on 21/03/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class TwitterViewController: TabmanViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        // set appearance
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in
            
            // colors
            appearance.indicator.color = UIColor.twitterBlue
            appearance.state.selectedColor = UIColor.twitterBlue
            appearance.state.color = UIColor.twitterGray
            
            appearance.text.font = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightMedium)
            
            // layout
            appearance.layout.height = .explicit(value: 44.0)
            appearance.layout.interItemSpacing = 20.0
        })
    }
    
}

extension TwitterViewController: PageboyViewControllerDataSource {
    
    func viewControllers(forPageboyViewController pageboyViewController: PageboyViewController) -> [UIViewController]? {
        let tweetsViewController = childViewController(withTitle: "Tweets")
        let repliesViewController = childViewController(withTitle: "Tweets & Replies")
        let mediaViewController = childViewController(withTitle: "Media")
        let likesViewController = childViewController(withTitle: "Likes")
        
        let viewControllers = [tweetsViewController, repliesViewController, mediaViewController, likesViewController]
        
        // create bar items
        var barItems = [TabmanBarItem]()
        for viewController in viewControllers {
            barItems.append(TabmanBarItem(title: viewController.pageTitle!.uppercased()))
        }
        
        self.bar.items = barItems
        return viewControllers
    }
    
    private func childViewController(withTitle title: String) -> TwitterChildViewController {
        let storyboard = UIStoryboard(name: "Twitter", bundle: Bundle.main)
        let identifier = "TwitterChildViewController"
        
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! TwitterChildViewController
        viewController.pageTitle = title
        
        return viewController
    }
    
    func defaultPageIndex(forPageboyViewController pageboyViewController: PageboyViewController) -> PageboyViewController.PageIndex? {
        return nil
    }
}

