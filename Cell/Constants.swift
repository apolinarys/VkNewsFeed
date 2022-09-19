//
//  Constants.swift
//  VkNewsFeed
//
//  Created by Macbook on 18.09.2022.
//

import UIKit

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 48
    static let postLabelInsets = UIEdgeInsets(top: 10 + Constants.topViewHeight + 10, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let bottomViewHeight: CGFloat = 48
    static let bottomViewViewWidth: CGFloat = 80
    static let imageHeight: CGFloat = 24
    static let labelHeight: CGFloat = 12
    static let labelWidth: CGFloat = 42
    static let minifiedPostLimitsLines: CGFloat = 8
    static let minifiedPostLines: CGFloat = 6
    static let moreTextButtonSize = CGSize(width: 170, height: 30)
    static let moreTextButtonInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
}
