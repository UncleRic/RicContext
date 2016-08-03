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
    
    func insetBy(_ amount: CGFloat) -> CGRect {
        return self.insetBy(dx: amount, dy: amount)
    }
}

// ===================================================================================================
// Utility methods that encapsulate the CoreGraphics API.

internal extension CGContext {
    func strokeLineFrom(_ from: CGPoint, to: CGPoint, color: UIColor, width: CGFloat, lineCap: CGLineCap) {
        self.setStrokeColor(color.cgColor)
        self.setLineWidth(width)
        self.setLineCap(lineCap)
        self.moveTo(x: from.x, y: from.y)
        self.addLineTo(x: to.x, y: to.y)
        self.strokePath()
    }
    
    func fillRect(_ rect: CGRect, color: UIColor) {
        self.setFillColor(color.cgColor)
        self.fill(rect)
        self.strokePath()
    }
    
    func strokeRect(_ rect: CGRect, color: UIColor, width: CGFloat) {
        self.setLineWidth(width)
        self.setStrokeColor(color.cgColor)
        self.addRect(rect)
        self.strokePath()
    }
    
    func strokeEllipseInRect(_ rect: CGRect, color: UIColor, width: CGFloat) {
        self.setStrokeColor(color.cgColor)
        self.setLineWidth(width)
        self.addEllipse(inRect: rect)
        self.strokePath()
    }
}


