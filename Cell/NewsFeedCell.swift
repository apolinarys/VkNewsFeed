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
    var photoAttachment: FeedCellPhotoAttachmentViewModel? {get}
    var sizes: FeedCellSizes {get}
}

protocol FeedCellSizes {
    var postLabelFrame: CGRect {get}
    var attachmentFrame: CGRect {get}
    var bottomView: CGRect {get}
    var totalHeight: CGFloat {get}
    var moreTextButtonFrame: CGRect {get}
}

protocol FeedCellPhotoAttachmentViewModel {
    var photoUrlString: String? {get}
    var width: Int {get}
    var height: Int {get}
}

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var iconImageView: WebImageView!
    @IBOutlet weak var postImageView: WebImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    override func prepareForReuse() {
        iconImageView.set(imageURL: nil)
        postImageView.set(imageURL: nil)
    }
    
    
    static let reuseId = "NewsFeedCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageURL: viewModel.imageUrlString)
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        iconImageView.clipsToBounds = true
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        backgroundColor = .clear
        selectionStyle = .none
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomView
        
        if let photoAttachment = viewModel.photoAttachment {
            postImageView.set(imageURL: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
}
