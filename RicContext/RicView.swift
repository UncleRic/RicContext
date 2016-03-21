//  RicView.swift
//  RicContext
//
//  Created by Frederick C. Lee on 3/20/16.
//  Copyright © 2016 Swift International. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import Foundation
import UIKit

final class RicView:UIView {
    
    var gameBoard: String? {
        didSet {
            //  _layout = nil
            //  _renderer = nil
            //    winningPositions = nil
        }
    }
    
    // Computed Variable: renderer:
       private var renderer: Renderer {
        let context = UIGraphicsGetCurrentContext()!
        return Renderer(context: context)
    }
    
    private var layout: GameBoardLayout {
        return GameBoardLayout(frame: frame, marksPerAxis: 3)
    }

    func renderBorder() {
        let context = UIGraphicsGetCurrentContext()!
        context.strokeRect(layout.outerBorderRect, color: UIColor.outerBorder, width: Thickness.outerBorder)
        context.strokeRect(layout.innerBorderRect, color: UIColor.innerBorder, width: Thickness.innerBorder)
    }

    func renderPlatform() {
        let context = UIGraphicsGetCurrentContext()!
        context.fillRect(layout.platformRect, color: UIColor.platform)
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func renderGridLines() {
        let context = UIGraphicsGetCurrentContext()!
        layout.gridLines.forEach {
            context.strokeLineFrom($0.startPoint, to: $0.endPoint, color: UIColor.gridLine, width: Thickness.gridLine, lineCap: .Butt)
        }
    }

    // -----------------------------------------------------------------------------------------------------
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        renderBorder()
        renderPlatform()
        renderGridLines()
    }
}

// ===================================================================================================

final class Renderer {
    private let context: CGContextRef
    //   private let gameBoard: GameBoard
    //   private let layout: GameBoardLayout
    
    init(context: CGContextRef) {
        self.context = context
        
    }
    
}

// ===================================================================================================

private extension UIColor {
    static let
    gridLine    = UIColor.darkGrayColor(),
    innerBorder = UIColor.darkGrayColor(),
    markO       = UIColor.blueColor(),
    markX       = UIColor.greenColor(),
    outerBorder = UIColor.whiteColor(),
    platform    = UIColor.whiteColor(),
    winningLine = UIColor.redColor()
}

    