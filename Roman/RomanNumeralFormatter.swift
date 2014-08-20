//
//  RomanNumeralFormatter.swift
//  Roman
//
//  Created by Robert Walker on 8/18/14.
//  Copyright (c) 2014 Robert Walker. All rights reserved.
//

import Cocoa

public class RomanNumeralFormatter: NSFormatter {
    let romanDigits = [
        ("M", 1000),
        ("D", 500),
        ("C", 100),
        ("L", 50),
        ("X", 10),
        ("V", 5),
        ("I", 1)
    ]
    
    override public func stringForObjectValue(obj: AnyObject!) -> String! {
        if let possibleInt = obj as? Int {
            return stringForInteger(possibleInt, formattingUnitStyle: .Short)
        }
        return nil
    }
    
    public func stringForInteger(obj: Int) -> String! {
        return stringForInteger(obj, formattingUnitStyle: .Short)
    }
    
    public func stringForInteger(obj: Int, formattingUnitStyle: NSFormattingUnitStyle) -> String! {
        var romanComponents: [String] = []
        var decimal = obj
        
        // Invalid Roman numbers
        if decimal <= 0 || decimal > 3999 {
            return nil
        }
        
        for (symbol, value) in romanDigits {
            var segment = ""
            var segmentLength = 0
            while decimal >= value {
                segment += symbol
                decimal -= value
                segmentLength = countElements(segment)
                if (formattingUnitStyle == .Short && segmentLength > 3) {
                    let (newSegment, replacesLast) = subtractiveNotation(romanComponents, segment: segment)
                    if newSegment != segment {
                        if (replacesLast && romanComponents.count > 0) {
                            romanComponents.removeLast()
                        }
                        segment = newSegment
                    }
                }
            }
            if countElements(segment) > 0 {
                romanComponents.append(segment)
            }
        }
        
        return "".join(romanComponents)
    }
    
    private func subtractiveNotation(romanComponents: [String], segment: String) -> (String, Bool) {
        var lastDigit = ""
        if let lastComponent = romanComponents.last {
            if countElements(lastComponent) > 0 {
                lastDigit = lastComponent.substringFromIndex(advance(lastComponent.endIndex, -1))
            }
        }
        
        switch segment {
        case "CCCC":
            return lastDigit == "D" ? ("CM", true) : ("CD", false)
        case "XXXX":
            return lastDigit == "L" ? ("XC", true) : ("XL", false)
        case "IIII":
            return lastDigit == "V" ? ("IX", true) : ("IV", false)
        default:
            return (segment, false)
        }
    }
}
