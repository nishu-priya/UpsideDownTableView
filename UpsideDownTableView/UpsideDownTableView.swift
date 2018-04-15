//
//  UpsideDownTableView.swift
//  UpsideDownTableView
//
//  Created by Nishu Priya on 4/15/18.
//  Copyright © 2018 Nishu Priya. All rights reserved.
//

import UIKit

class UpsideDownTableView: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.showsVerticalScrollIndicator = false
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.showsVerticalScrollIndicator = false
    }
}
