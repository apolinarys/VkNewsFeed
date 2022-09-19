//
//  NewsFeedCellLayoutCompilator.swift
//  VkNewsFeed
//
//  Created by Macbook on 17.09.2022.
//

import UIKit

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomView: CGRect
    var totalHeight: CGFloat
    var moreTextButtonFrame: CGRect
}

protocol FeedCellLayoutCalculatorProtocol {
    func sizes (postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?, isFullSized: Bool) -> FeedCellSizes
}

final class NewsFeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {

    private let screenWidth: CGFloat
    
    init (screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?, isFullSized: Bool) -> FeedCellSizes {
        
        var showMoreTextButton = false
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        //MARK: - postLableFrame
        
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top), size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            var height = text.height(width: width, font: Constants.postLabelFont)
            
            let limitHeight = Constants.postLabelFont.lineHeight * Constants.minifiedPostLimitsLines
            if !isFullSized && height > limitHeight {
                height = Constants.minifiedPostLines * Constants.postLabelFont.lineHeight
                showMoreTextButton = true
            }
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        //MARK: - moreTextButtonFrame
        var showMoreTextButtonSize = CGSize.zero
        
        if showMoreTextButton {
            showMoreTextButtonSize = Constants.moreTextButtonSize
        }
        let moreTextButtonFrame = CGRect(origin: CGPoint(x: Constants.moreTextButtonInsets.left, y: postLabelFrame.maxY), size: showMoreTextButtonSize)
        
        //MARK: - attachmentFrame
        
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : moreTextButtonFrame.maxY + Constants.postLabelInsets.bottom
        
        var attachmentFrame = CGRect(origin: CGPoint(x: 0, y: attachmentTop), size: CGSize.zero)
        
        if let photoAttachment = photoAttachment {
            let photoHeight = CGFloat(Float(photoAttachment.height) / Float(photoAttachment.width)) * cardViewWidth
            
            attachmentFrame.size = CGSize(width: cardViewWidth, height: photoHeight)
        }
        
        //MARK: - BottomView and TotalHeight
        
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        
        let bottomView = CGRect(origin: CGPoint(x: 0, y: bottomViewTop), size: CGSize(width: cardViewWidth, height: 50))
        
        let totalHeight =  bottomView.maxY + Constants.cardInsets.bottom
        
        return Sizes(postLabelFrame: postLabelFrame, attachmentFrame: attachmentFrame, bottomView: bottomView, totalHeight: totalHeight, moreTextButtonFrame: moreTextButtonFrame)
    }
}
