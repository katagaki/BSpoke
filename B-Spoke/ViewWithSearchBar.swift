//
//  ViewWithSearchBar.swift
//  B-Spoke
//
//  Created by katagaki on 2019/11/12.
//  Copyright © 2019 B-Spoke. All rights reserved.
//

import UIKit

class ViewWithSearchBar:UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let search:UISearchController = UISearchController()
        let navigation:UINavigationItem = self.navigationItem
        navigation.hidesSearchBarWhenScrolling = false
        navigation.searchController = search
        search.automaticallyShowsCancelButton = true
    }
    
}
