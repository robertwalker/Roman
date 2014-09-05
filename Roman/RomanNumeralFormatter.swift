//
//  RomanNumeralFormatter.swift
//  Roman
//
//  Created by Robert Walker on 8/18/14.
//  Copyright (c) 2014 Robert Walker. All rights reserved.
//

import Cocoa

public class RomanNumeralFormatter: NSFormatter {
    public var formattingUnitStyle = NSFormattingUnitStyle.Short
    
    let romanDigits = [ "M", "D", "C", "L", "X", "V", "I" ]
    let romanDigitValues = [
        "M": 1000,
        "D": 500,
        "C": 100,
        "L": 50,
        "X": 10,
        "V": 5,
        "I": 1
    ]
    
    override public func stringForObjectValue(obj: AnyObject) -> String? {
        if let possibleInt = obj as? Int {
            return stringForInteger(possibleInt)
        }
        return nil
    }
    
    public func stringForInteger(obj: Int) -> String? {
        var romanComponents: [String] = []
        var decimal = obj
        
        // Invalid Roman numbers
        if decimal <= 0 || decimal > 3999 {
            return nil
        }
        
        for symbol in romanDigits {
            if let value = romanDigitValues[symbol] {
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
            else {
                return nil
            }
        }
        
        return "".join(romanComponents)
    }
    
    override public func getObjectValue(obj: AutoreleasingUnsafeMutablePointer<AnyObject?>, forString string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool {
        
        return true
    }
    
    public func numberForRomanNumeral(roman: String) -> Int? {
        var decimal = 0
        
        let longRoman = additiveNotation(roman)
        for character in longRoman {
            if let value = romanDigitValues[String(character)] {
                decimal += value
            }
        }
        return decimal
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
    
    private func additiveNotation(roman: String) -> String {
        var longRoman = roman
        let notations = [
            "CM": "DCCCC",
            "CD": "CCCC",
            "XC": "LXXXX",
            "XL": "XXXX",
            "IX": "VIIII",
            "IV": "IIII"
        ]
        
        for (shortNotation, longNotation) in notations {
            longRoman = longRoman.stringByReplacingOccurrencesOfString(shortNotation, withString: longNotation)
        }
        
        return longRoman
    }
}
