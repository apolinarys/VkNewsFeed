//
//  NewsFeedCell.swift
//  VkNewsFeed
//
//  Created by Macbook on 16.09.2022.
//

import Foundation
import UIKit

protocol FeedCellViewModel {
    var imageUrlString: String {get}
    var name: String { get }
    var date: String { get }
    var text: String? {get}
    var likes: String? {get}
    var comments: String? {get}
    var shares: String? {get}
    var views: String? {get}
}

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: WebImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    
    static let reuseId = "NewsFeedCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageURL: viewModel.imageUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
    }
}
