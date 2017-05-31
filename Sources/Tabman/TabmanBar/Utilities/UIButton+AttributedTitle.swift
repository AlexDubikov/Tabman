//
//  UIButton+AttributedTitle.swift
//  Tabman
//
//  Created by Alexander Dubikov on 30/05/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation

extension UIButton {
    
    func getHighlightedAttributedString() -> NSAttributedString? {
        guard let attributedTitle = self.attributedTitle(for: .normal) else {
            return nil
        }
        
        let highlightedTitle = NSMutableAttributedString(attributedString: attributedTitle)
        
        let attributes = attributedTitle.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: attributedTitle.string.characters.count))
        
        if let color = attributes[NSForegroundColorAttributeName] as? UIColor {
            highlightedTitle.addAttributes([NSForegroundColorAttributeName: color.withAlphaComponent(0.3)], range: NSRange(location: 0, length: attributedTitle.string.characters.count))
        }
        
        return highlightedTitle
    }
    
    func getColorAttribute() -> UIColor? {
        guard let attributedTitle = self.attributedTitle(for: .normal) else {
            return nil
        }
        
        let attributes = attributedTitle.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0, length: attributedTitle.string.characters.count))
        
        guard let color = attributes[NSForegroundColorAttributeName] as? UIColor
        else {
            return nil
        }
        
        return color
    }
    
    func getAttributedStringWith(color: UIColor) -> NSAttributedString? {
        guard let attributedTitle = self.attributedTitle(for: .normal) else {
            return nil
        }
        
        let newTitle = NSMutableAttributedString(attributedString: attributedTitle)
        
        newTitle.addAttributes([NSForegroundColorAttributeName: color], range: NSRange(location: 0, length: attributedTitle.string.characters.count))
        
        return newTitle
    }
    
}
