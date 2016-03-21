//  CGContextExtension.swift
//  TicTacToeApp
//
//  Created by Joshua Smith on 12/18/15.
//  Copyright © 2015 iJoshSmith. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import UIKit

/** The thickness/width of user interface elements. */
internal struct Thickness {
    static let
    gridLine: CGFloat         =  4,
    innerBorder: CGFloat      =  1,
    mark: CGFloat             = 16,
    markMargin: CGFloat       = 20,
    outerBorder: CGFloat      =  1,
    platformMargin: CGFloat   = 16,
    winningLine: CGFloat      =  8,
    winningLineInset: CGFloat =  8
}

// ===================================================================================================

internal extension CGRect {
    var bottomCenter: CGPoint { return CGPoint(x: midX, y: maxY) }
    var bottomLeft:   CGPoint { return CGPoint(x: minX, y: maxY) }
    var bottomRight:  CGPoint { return CGPoint(x: maxX, y: maxY) }
    var center:       CGPoint { return CGPoint(x: midX, y: midY) }
    var centerLeft:   CGPoint { return CGPoint(x: minX, y: midY) }
    var centerRight:  CGPoint { return CGPoint(x: maxX, y: midY) }
    var topCenter:    CGPoint { return CGPoint(x: midX, y: minY) }
    var topLeft:      CGPoint { return CGPoint(x: minX, y: minY) }
    var topRight:     CGPoint { return CGPoint(x: maxX, y: minY) }
    
    func insetBy(amount: CGFloat) -> CGRect {
        return self.insetBy(dx: amount, dy: amount)
    }
}

// ===================================================================================================
// Utility methods that encapsulate the CoreGraphics API.

internal extension CGContext {
    func strokeLineFrom(from: CGPoint, to: CGPoint, color: UIColor, width: CGFloat, lineCap: CGLineCap) {
        CGContextSetStrokeColorWithColor(self, color.CGColor)
        CGContextSetLineWidth(self, width)
        CGContextSetLineCap(self, lineCap)
        CGContextMoveToPoint(self, from.x, from.y)
        CGContextAddLineToPoint(self, to.x, to.y)
        CGContextStrokePath(self)
    }
    
    func fillRect(rect: CGRect, color: UIColor) {
        CGContextSetFillColorWithColor(self, color.CGColor)
        CGContextFillRect(self, rect)
        CGContextStrokePath(self)
    }
    
    func strokeRect(rect: CGRect, color: UIColor, width: CGFloat) {
        CGContextSetLineWidth(self, width)
        CGContextSetStrokeColorWithColor(self, color.CGColor)
        CGContextAddRect(self, rect)
        CGContextStrokePath(self)
    }
    
    func strokeEllipseInRect(rect: CGRect, color: UIColor, width: CGFloat) {
        CGContextSetStrokeColorWithColor(self, color.CGColor)
        CGContextSetLineWidth(self, width)
        CGContextAddEllipseInRect(self, rect)
        CGContextStrokePath(self)
    }
}


