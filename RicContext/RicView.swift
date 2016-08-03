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
            context.strokeLineFrom($0.startPoint, to: $0.endPoint, color: UIColor.gridLine, width: Thickness.gridLine, lineCap: .butt)
        }
    }

    // -----------------------------------------------------------------------------------------------------
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        renderBorder()
        renderPlatform()
        renderGridLines()
    }
}

// ===================================================================================================

final class Renderer {
    private let context: CGContext
    //   private let gameBoard: GameBoard
    //   private let layout: GameBoardLayout
    
    init(context: CGContext) {
        self.context = context
        
    }
    
}

// ===================================================================================================

private extension UIColor {
    static let
    gridLine    = UIColor.darkGray,
    innerBorder = UIColor.darkGray,
    markO       = UIColor.blue,
    markX       = UIColor.green,
    outerBorder = UIColor.white,
    platform    = UIColor.white,
    winningLine = UIColor.red
}

    
