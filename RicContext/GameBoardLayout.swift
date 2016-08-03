//  GameBoardLayout.swift
//  TicTacToeApp
//
//  Created by Joshua Smith on 12/20/15.
//  Copyright © 2015 iJoshSmith. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import UIKit

/** Calculates sizes and positions used to render a game board. */
final class GameBoardLayout {
    
    typealias Line = (startPoint: CGPoint, endPoint: CGPoint)
    
    private let frame: CGRect
    private let marksPerAxis: Int
    
    init(frame: CGRect, marksPerAxis: Int) {
        self.frame = frame
        self.marksPerAxis = marksPerAxis
    }
    
    lazy var outerBorderRect: CGRect = {
        let
        width  = self.frame.width,
        height = self.frame.height,
        length = min(width, height) - (Thickness.platformMargin * 2),
        origin = CGPoint(x: width/2 - length/2, y: height/2 - length/2),
        size   = CGSize(width: length, height: length)
        return CGRect(origin: origin, size: size)
    }()
    
    lazy var innerBorderRect: CGRect = {
        return self.outerBorderRect.insetBy(Thickness.outerBorder)
    }()
    
    lazy var platformRect: CGRect = {
        return self.innerBorderRect.insetBy(Thickness.innerBorder)
    }()
    
    lazy var gridLines: [Line] = {
        let
        cellLength    = self.platformRect.width / CGFloat(self.marksPerAxis),
        lineNumbers   = 1..<self.marksPerAxis,
        verticalLines = lineNumbers.map { lineNumber -> Line in
            let x = self.platformRect.minX + CGFloat(lineNumber) * cellLength
            return Line(
                startPoint: CGPoint(x: x, y: self.platformRect.minY),
                endPoint:   CGPoint(x: x, y: self.platformRect.maxY))
        },
        horizontalLines = lineNumbers.map { lineNumber -> Line in
            let y = self.platformRect.minY + CGFloat(lineNumber) * cellLength
            return Line(
                startPoint: CGPoint(x: self.platformRect.minX, y: y),
                endPoint:   CGPoint(x: self.platformRect.maxX, y: y))
        }
        return verticalLines + horizontalLines
    }()
    
    // -----------------------------------------------------------------------------------------------------
    // ...when user selects a cell (via GameBoardView & self):
//    
//    func cellRectsAtPositions(positions: [GameBoard.Position]) -> [CGRect] {
//        return positions.map(cellRectAtPosition)
//    }
//    
//    // -----------------------------------------------------------------------------------------------------
//    // ...via GameBoadRenderer:
//    
//    func markRectAtPosition(position: GameBoard.Position) -> CGRect {
//        let cellRect = cellRectAtPosition(position)
//        return cellRect.insetBy(Thickness.gridLine/2 + Thickness.markMargin)
//    }
//    
//    // -----------------------------------------------------------------------------------------------------
//    // ...via GameBoadRenderer:
//    
//    func lineThroughWinningPositions(winningPositions: [GameBoard.Position]) -> Line {
//        let
//        cellRects   = cellRectsAtPositions(winningPositions),
//        startRect   = cellRects.first!,
//        endRect     = cellRects.last!,
//        orientation = winningLineOrientationForStartRect(startRect, endRect: endRect),
//        startPoint  = startPointForRect(startRect, winningLineOrientation: orientation),
//        endPoint    = endPointForRect(endRect, winningLineOrientation: orientation)
//        return (startPoint, endPoint)
//    }
//
    // -----------------------------------------------------------------------------------------------------
    // MARK: - Private Functions
    
    private enum WinningLineOrientation {
        case horizontal, vertical, topLeftToBottomRight, bottomLeftToTopRight
    }
    

    // -----------------------------------------------------------------------------------------------------
    
//    private func cellRectAtPosition(position: GameBoard.Position) -> CGRect {
//        let
//        length = platformRect.width / CGFloat(marksPerAxis),
//        left   = platformRect.minX + CGFloat(position.column) * length,
//        top    = platformRect.minY + CGFloat(position.row) * length
//        return CGRect(x: left, y: top, width: length, height: length)
//    }
    
    // -----------------------------------------------------------------------------------------------------
    
    private func winningLineOrientationForStartRect(_ startRect: CGRect, endRect: CGRect) -> WinningLineOrientation {
        let
        x1 = Int(startRect.minX), x2 = Int(endRect.minX),
        y1 = Int(startRect.minY), y2 = Int(endRect.minY)
        if x1 == x2 { return .vertical }
        if y1 == y2 { return .horizontal }
        if y1 <  y2 { return .topLeftToBottomRight }
        return .bottomLeftToTopRight
    }
    
//    private func startPointForRect(rect: CGRect, winningLineOrientation: WinningLineOrientation) -> CGPoint {
//        let winningRect = rect.insetBy(Thickness.winningLineInset)
//        switch winningLineOrientation {
//        case .Horizontal:           return winningRect.centerLeft
//        case .Vertical:             return winningRect.topCenter
//        case .TopLeftToBottomRight: return winningRect.topLeft
//        case .BottomLeftToTopRight: return winningRect.bottomLeft
//        }
//    }
//    
//    private func endPointForRect(rect: CGRect, winningLineOrientation: WinningLineOrientation) -> CGPoint {
//        let winningRect = rect.insetBy(Thickness.winningLineInset)
//        switch winningLineOrientation {
//        case .Horizontal:           return winningRect.centerRight
//        case .Vertical:             return winningRect.bottomCenter
//        case .TopLeftToBottomRight: return winningRect.bottomRight
//        case .BottomLeftToTopRight: return winningRect.topRight
//        }
//    }
    
   
}
