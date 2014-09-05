//
//  NSNumberFormatterExtensionTests.swift
//  Roman
//
//  Created by Robert Walker on 8/14/14.
//  Copyright (c) 2014 Robert Walker. All rights reserved.
//

import Cocoa
import XCTest
import Roman

class RomanNumeralFormatterTests: XCTestCase {
    var shortFormatter: RomanNumeralFormatter?
    var longFormatter: RomanNumeralFormatter?
    
    override func setUp() {
        super.setUp()
        
        // Default short formatter using subtractive notation
        shortFormatter = RomanNumeralFormatter()
        
        // Optional long formatter using additive notation
        longFormatter = RomanNumeralFormatter()
        longFormatter?.formattingUnitStyle = .Long
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //
    // Invalid decimal numbers for Roman conversion
    //
    
    func testZeroInteger() {
        if let roman = shortFormatter?.stringForInteger(0) {
            XCTFail("Result should have no value but was \(roman)")
        }
    }
    
    func testOverflowInteger() {
        if let roman = shortFormatter?.stringForInteger(4000) {
            XCTFail("Result should have no value but was \(roman)")
        }
    }
    
    func testNegativeInteger() {
        if let roman = shortFormatter?.stringForInteger(-1) {
            XCTFail("Result should have no value but was \"\(roman)\"!")
        }
    }
    
    //
    // Valid decmial numbers that can be converted to Roman numerals
    //
    
    func testPositiveIntegerThreeThousand() {
        if let roman = shortFormatter?.stringForInteger(3000) {
            XCTAssertEqual(roman, "MMM", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerOneThousand() {
        if let roman = shortFormatter?.stringForInteger(1000) {
            XCTAssertEqual(roman, "M", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerNineHundredLong() {
        if let roman = longFormatter?.stringForInteger(900) {
            XCTAssertEqual(roman, "DCCCC", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerNineHundredShort() {
        if let roman = shortFormatter?.stringForInteger(900) {
            XCTAssertEqual(roman, "CM", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFiveHundred() {
        if let roman = shortFormatter?.stringForInteger(500) {
            XCTAssertEqual(roman, "D", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFourHundredLong() {
        if let roman = longFormatter?.stringForInteger(400) {
            XCTAssertEqual(roman, "CCCC", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFourHundredShort() {
        if let roman = shortFormatter?.stringForInteger(400) {
            XCTAssertEqual(roman, "CD", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerThreeHundred() {
        if let roman = shortFormatter?.stringForInteger(300) {
            XCTAssertEqual(roman, "CCC", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerOneHundred() {
        if let roman = shortFormatter?.stringForInteger(100) {
            XCTAssertEqual(roman, "C", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerNinetyLong() {
        if let roman = longFormatter?.stringForInteger(90) {
            XCTAssertEqual(roman, "LXXXX", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerNinetyShort() {
        if let roman = shortFormatter?.stringForInteger(90) {
            XCTAssertEqual(roman, "XC", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFifty() {
        if let roman = shortFormatter?.stringForInteger(50) {
            XCTAssertEqual(roman, "L", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFourtyLong() {
        if let roman = longFormatter?.stringForInteger(40) {
            XCTAssertEqual(roman, "XXXX", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFourtyShort() {
        if let roman = shortFormatter?.stringForInteger(40) {
            XCTAssertEqual(roman, "XL", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerThirty() {
        if let roman = shortFormatter?.stringForInteger(30) {
            XCTAssertEqual(roman, "XXX", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerTen() {
        if let roman = shortFormatter?.stringForInteger(10) {
            XCTAssertEqual(roman, "X", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerNineLong() {
        if let roman = longFormatter?.stringForInteger(9) {
            XCTAssertEqual(roman, "VIIII", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerNineShort() {
        if let roman = shortFormatter?.stringForInteger(9) {
            XCTAssertEqual(roman, "IX", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFive() {
        if let roman = shortFormatter?.stringForInteger(5) {
            XCTAssertEqual(roman, "V", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFourLong() {
        if let roman = longFormatter?.stringForInteger(4) {
            XCTAssertEqual(roman, "IIII", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerFourShort() {
        if let roman = shortFormatter?.stringForInteger(4) {
            XCTAssertEqual(roman, "IV", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerThree() {
        if let roman = shortFormatter?.stringForInteger(3) {
            XCTAssertEqual(roman, "III", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testPositiveIntegerOne() {
        if let roman = shortFormatter?.stringForInteger(1) {
            XCTAssertEqual(roman, "I", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    //
    // More valid arbitratry examples
    //
    
    func testMaximumPositiveInteger() {
        if let roman = shortFormatter?.stringForInteger(3999) {
            XCTAssertEqual(roman, "MMMCMXCIX", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testTwentyFourteen() {
        if let roman = shortFormatter?.stringForInteger(2014) {
            XCTAssertEqual(roman, "MMXIV", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testNextSuperBowlTwentyFifteen() {
        if let roman = shortFormatter?.stringForInteger(49) {
            XCTAssertEqual(roman, "XLIX", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
    
    func testMac128KReleaseYear() {
        if let roman = shortFormatter?.stringForInteger(1984) {
            XCTAssertEqual(roman, "MCMLXXXIV", "Expected values to match")
        }
        else {
            XCTFail("Romanizer.toRoman() returned nil")
        }
    }
}
