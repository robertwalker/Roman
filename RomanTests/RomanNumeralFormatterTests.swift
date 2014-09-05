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
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerOneThousand() {
        if let roman = shortFormatter?.stringForInteger(1000) {
            XCTAssertEqual(roman, "M", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerNineHundredLong() {
        if let roman = longFormatter?.stringForInteger(900) {
            XCTAssertEqual(roman, "DCCCC", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerNineHundredShort() {
        if let roman = shortFormatter?.stringForInteger(900) {
            XCTAssertEqual(roman, "CM", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFiveHundred() {
        if let roman = shortFormatter?.stringForInteger(500) {
            XCTAssertEqual(roman, "D", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFourHundredLong() {
        if let roman = longFormatter?.stringForInteger(400) {
            XCTAssertEqual(roman, "CCCC", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFourHundredShort() {
        if let roman = shortFormatter?.stringForInteger(400) {
            XCTAssertEqual(roman, "CD", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerThreeHundred() {
        if let roman = shortFormatter?.stringForInteger(300) {
            XCTAssertEqual(roman, "CCC", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerOneHundred() {
        if let roman = shortFormatter?.stringForInteger(100) {
            XCTAssertEqual(roman, "C", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerNinetyLong() {
        if let roman = longFormatter?.stringForInteger(90) {
            XCTAssertEqual(roman, "LXXXX", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerNinetyShort() {
        if let roman = shortFormatter?.stringForInteger(90) {
            XCTAssertEqual(roman, "XC", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFifty() {
        if let roman = shortFormatter?.stringForInteger(50) {
            XCTAssertEqual(roman, "L", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFourtyLong() {
        if let roman = longFormatter?.stringForInteger(40) {
            XCTAssertEqual(roman, "XXXX", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFourtyShort() {
        if let roman = shortFormatter?.stringForInteger(40) {
            XCTAssertEqual(roman, "XL", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerThirty() {
        if let roman = shortFormatter?.stringForInteger(30) {
            XCTAssertEqual(roman, "XXX", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerTen() {
        if let roman = shortFormatter?.stringForInteger(10) {
            XCTAssertEqual(roman, "X", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerNineLong() {
        if let roman = longFormatter?.stringForInteger(9) {
            XCTAssertEqual(roman, "VIIII", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerNineShort() {
        if let roman = shortFormatter?.stringForInteger(9) {
            XCTAssertEqual(roman, "IX", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFive() {
        if let roman = shortFormatter?.stringForInteger(5) {
            XCTAssertEqual(roman, "V", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFourLong() {
        if let roman = longFormatter?.stringForInteger(4) {
            XCTAssertEqual(roman, "IIII", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerFourShort() {
        if let roman = shortFormatter?.stringForInteger(4) {
            XCTAssertEqual(roman, "IV", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerThree() {
        if let roman = shortFormatter?.stringForInteger(3) {
            XCTAssertEqual(roman, "III", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testPositiveIntegerOne() {
        if let roman = shortFormatter?.stringForInteger(1) {
            XCTAssertEqual(roman, "I", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
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
            XCTFail("Conversion method return no value")
        }
    }
    
    func testTwentyFourteen() {
        if let roman = shortFormatter?.stringForInteger(2014) {
            XCTAssertEqual(roman, "MMXIV", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testNextSuperBowlTwentyFifteen() {
        if let roman = shortFormatter?.stringForInteger(49) {
            XCTAssertEqual(roman, "XLIX", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testMac128KReleaseYear() {
        if let roman = shortFormatter?.stringForInteger(1984) {
            XCTAssertEqual(roman, "MCMLXXXIV", "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    //
    // Conveting Roman Numerals to Decimal
    //
    
    func testRomanNumeralI() {
        if let decimal = shortFormatter?.numberForRomanNumeral("I") {
            XCTAssertEqual(decimal, 1, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralV() {
        if let decimal = shortFormatter?.numberForRomanNumeral("V") {
            XCTAssertEqual(decimal, 5, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralIV() {
        if let decimal = shortFormatter?.numberForRomanNumeral("IV") {
            XCTAssertEqual(decimal, 4, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralIIII() {
        if let decimal = shortFormatter?.numberForRomanNumeral("IIII") {
            XCTAssertEqual(decimal, 4, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralIX() {
        if let decimal = shortFormatter?.numberForRomanNumeral("IX") {
            XCTAssertEqual(decimal, 9, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }

    func testRomanNumeralXL() {
        if let decimal = shortFormatter?.numberForRomanNumeral("XL") {
            XCTAssertEqual(decimal, 40, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralXC() {
        if let decimal = shortFormatter?.numberForRomanNumeral("XC") {
            XCTAssertEqual(decimal, 90, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralCD() {
        if let decimal = shortFormatter?.numberForRomanNumeral("CD") {
            XCTAssertEqual(decimal, 400, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralCM() {
        if let decimal = shortFormatter?.numberForRomanNumeral("CM") {
            XCTAssertEqual(decimal, 900, "Expected value to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }

    func testMaximumPositiveRomanNumeral() {
        if let decimal = shortFormatter?.numberForRomanNumeral("MMMCMXCIX") {
            XCTAssertEqual(decimal, 3999, "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralTwentyFourteen() {
        if let decimal = shortFormatter?.numberForRomanNumeral("MMXIV") {
            XCTAssertEqual(decimal, 2014, "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralNextSuperBowlTwentyFifteen() {
        if let decimal = shortFormatter?.numberForRomanNumeral("XLIX") {
            XCTAssertEqual(decimal, 49, "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
    
    func testRomanNumeralMac128KReleaseYear() {
        if let decimal = shortFormatter?.numberForRomanNumeral("MCMLXXXIV") {
            XCTAssertEqual(decimal, 1984, "Expected values to match")
        }
        else {
            XCTFail("Conversion method return no value")
        }
    }
}
