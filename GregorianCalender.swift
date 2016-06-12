//
//  GregorianCalender.swift
//  proj5App
//
//  Created by Adolfo Moreno on 4/21/16.
//  Copyright © 2016 Adolfo Moreno. All rights reserved.
//  Net-ID: asmoren2
//
import Foundation

// Gregorian Calendar class to calculate the amount of days in between two dates.
// Checks if the input is correct.

class GregorianCalendar{
    var nonLeapYear: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30,31,30,31] // Used to calculate days non leap year
    
    // Function to determine if a year is a leap year
    class func isLeapYear(currentYear:Int)->Bool{
        if currentYear % 4 == 0{
            if currentYear % 100 == 0 && currentYear % 400 != 0{
                return false
            }
            else{
                return true
            }
        }
        return false
    }
    
    // Used to calculate the total number between the two years as a whole
    class func daysInYear(currYear:Int, futureYear:Int)->Int{
        var totalDays = 0 // total number of days calculated
        var start = currYear
        while start < futureYear {
            if isLeapYear(start) == false{
                totalDays += 365
            }
            else if isLeapYear(start) == true{
                totalDays += 366
            }
            start += 1 // update the current year by one to traverse
        }
        return totalDays
    }
    
    // Function counts the amount of days from January, the day specified for example if we input 
    class func daysFromBeginning(currentMonth: Int, currentDay:Int, currentYear:Int)->Int{
        var totalDays = 0 // hold the total number of days
        var leapYear: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30,31,30,31] // Used to calculate days under leap year
        var nonLeapYear: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30,31,30,31] // Used to calculate days non leap year


        if isLeapYear(currentYear) == true{
            for i in 0 ..< currentMonth-1 { // I do currentMonth - 1 here because i don't want to grab the last month so that I can add the rest
                totalDays += leapYear[i] // add all of the days from the beginning of the year to specified month for leap year
            }
        }
        else if isLeapYear(currentYear) == false{
            for i in 0 ..< currentMonth-1 {
                totalDays += nonLeapYear[i] // add all of the days from the beginning of the year to specified month for non leap
            }
        }
        
        return totalDays + currentDay // add the days from the month to the days specified
    }
    
    // Make sure the user inputs valid dates. Still working on this
    class func isCorrectInput(cMonth:Int, cDay:Int, cYear:Int, fMonth:Int, fDay:Int, fYear:Int)->String{
        var nonLeapYear: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30,31,30,31] // Used to calculate days non leap year
        var leapYear: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30,31,30,31] // Used to calculate days under leap year

        if cMonth > 12 || cMonth <= 0 || fMonth > 12 || fMonth <= 0{
            return "Error: Month is > 12 or <= 0"
        }
        // check that days never goes under 0 or 0, or over 31
        if cDay <= 0 || cDay > nonLeapYear[cMonth-1] || fDay <= 0 || fDay > nonLeapYear[fMonth-1] {
            return "Error: Date is <= 0 or > max"
        }
        // Per piazza can not go lower than 1582
        if cYear < 1582 || fYear < 1582{
            return "Error: Year is less than 1582"
        }
        if isLeapYear(cYear) == true || isLeapYear(fYear) == true{
            if cDay <= 0 || cDay > leapYear[cMonth-1] || fDay <= 0 || fDay > leapYear[fMonth-1]{
                    return "Error: Leap year Feb. day > 29"
            }
        }
        if isLeapYear(cYear) == false || isLeapYear(fYear) == false{
            if cDay <= 0 || cDay > nonLeapYear[cMonth-1] || fDay <= 0 || fDay > nonLeapYear[fMonth-1]{
                    return "Error: Non Leap year Feb. day > 28"
            }
        }
            return ""
    }
    
    // Return the total amount of days between two dates
    class func getTotalDays(cMonth:Int, cDay:Int, cYear:Int, fMonth:Int, fDay:Int, fYear:Int)->Int{
        var totalDays = 0
        
        let totalCDays = daysFromBeginning(cMonth, currentDay: cDay, currentYear: cYear)
        let totalFDays = daysFromBeginning(fMonth, currentDay: fDay, currentYear: fYear)
        let tDay = daysInYear(cYear, futureYear: fYear)
        
        totalDays = tDay - totalCDays + totalFDays // minus the days where we start + the days where we end
        
        return totalDays
    }
}
