//
//  Utilities.swift
//  WorkLifeBalance
//
//  Created by nikita lalwani on 4/13/19.
//  Copyright © 2019 nikita lalwani. All rights reserved.
//

import UIKit
import Firebase

    public class Utilities: NSObject {

static var currentAppUser = Auth.auth().currentUser?.email ?? ""
            
        static var helper: Utilities = {
            return Utilities()
        }()

        
        func dayOfWeek(weekDay: Int) -> String {
            switch weekDay {
            case 1:
                return "Sun"
            case 2:
                return "Mon"
            case 3:
                return "Tue"
            case 4:
                return "Wed"
            case 5:
                return "Thu"
            case 6:
                return "Fri"
            case 7:
                return "Sat"
            default:
                print("Error fetching days")
                return "Day"
            }
        }
        func isValidEmail(testStr:String) -> Bool {
            
            var returnValue = true
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            do {
                let regex = try NSRegularExpression(pattern: emailRegEx)
                let results = regex.matches(in: testStr, range: NSRange(location: 0, length: testStr.characters.count))
                
                if results.count == 0
                {
                    returnValue = false
                }
                
            } catch _ as NSError {
                returnValue = false
            }
            
            return  returnValue
        }
        
        func isValidAge(test:Int) -> Bool {
            let convertedInt = test
            if convertedInt > 0 && convertedInt % 1 == 0 {
                return true
            } else {
                return false
            }
        }
        
        func showAlert(message:String, vc:UIViewController) {
            
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
            vc.present(alert, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        }
    }


    extension UITextView {
        
        func clearTextField() {
            self.text = ""
        }
        func createTextView() {
            let textView = self
            textView.textAlignment = NSTextAlignment.justified
            
            textView.textColor = UIColor.black
            if let fontStr = self.font?.fontName {
                textView.font = UIFont(name: fontStr, size: 25)
            }
        }
    }

    extension Array { // error: Expected identifier for type name
        mutating func remove(_ object: AnyObject) {
            if let index = index(where: { $0 as AnyObject === object }) {
                remove(at: index)
            }
        }
    }
    
    public extension UIAlertController {
        func show() {
            let win = UIWindow(frame: UIScreen.main.bounds)
            let vc = UIViewController()
            vc.view.backgroundColor = .clear
            win.rootViewController = vc
            win.windowLevel = UIWindow.Level.alert - 1
            win.makeKeyAndVisible()
            vc.present(self, animated: true, completion: nil)
        }
    }
    
    extension Date {
        
        func toString() -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss:SSS - MMM dd, yyyy"
            return dateFormatter.string(from: self)
        }
        
        func dayNumberOfWeek() -> Int {
            return Calendar.current.component(.weekday, from: self)
        }


        
        func offsetFrom(date : Date) -> Double {
            
            let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
            let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self);
            
            let seconds = "\(difference.second ?? 0)s"
            let minutes = "\(difference.minute ?? 0)m" + " " + seconds
            let hours = "\(difference.hour ?? 0)h" + " " + minutes
            let days = "\(difference.day ?? 0)d" + " " + hours
            
            if let day = difference.day, day          > 0 { return Double(days) ?? 0.0 }
            if let hour = difference.hour, hour       > 0 { return Double(hours) ?? 0.0 }
            if let minute = difference.minute, minute > 0 { return Double(minutes) ?? 0.0 }
            if let second = difference.second, second > 0 { return Double(seconds) ?? 0.0 }
            return 0.0
        }
        
        func getDateAndTime(date: Date) -> Date {
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = .full
            
            dateFormatter.timeStyle = .full
            
            return dateFormatter.date(from: date.toString()) ?? Date()
        }
        
        public func hoursMinutesFromDate(date startDate: Date,
                                         toDate endDate: Date ) -> (hours: Int, minutes: Int, seconds:Int) {
            let cal = Calendar.current
            let comps = cal.dateComponents([.hour, .minute, .second], from: startDate, to: endDate)
            return (comps.hour!, comps.minute!, comps.second!)
        }
    }
    
    extension UIImage {
        func resizedImage(newSize: CGSize) -> UIImage {
            // Guard newSize is different
            guard self.size != newSize else { return self }
            
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return newImage
        }
        
        /// Returns a resized image that fits in rectSize, keeping it's aspect ratio
        /// Note that the new image size is not rectSize, but within it.
        func resizedImageWithinRect(rectSize: CGSize) -> UIImage {
            let widthFactor = size.width / rectSize.width
            let heightFactor = size.height / rectSize.height
            
            var resizeFactor = widthFactor
            if size.height > size.width {
                resizeFactor = heightFactor
            }
            
            let newSize = CGSize(width: size.width/resizeFactor, height: size.height/resizeFactor)
            let resized = resizedImage(newSize: newSize)
            return resized
        }
    }
    
    extension UIDatePicker {
        
        
        func addRoundCorner() {
            self.layer.cornerRadius = 20
        }
        
        func getDate() -> String? {
            self.datePickerMode = UIDatePicker.Mode.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            return dateFormatter.string(from: self.date)
        }
    }
    
    extension String {
            func toDate() -> Date {
                let formater = DateFormatter()
                formater.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
                return formater.date(from: self) ?? Date()
            }
    }


extension UIColor {
    static let customPurpleColor = UIColor(red: 227.0/255.0, green: 125.0/255.0, blue: 219.0/255.0, alpha: 1.0)
    static let darkPurpleColor = UIColor(red: 92.0/255.0, green: 0/255.0, blue: 144.0/255.0, alpha: 1.0)
    static let lightpurpleColor = UIColor(red: 198.0/255.0, green: 145/255.0, blue: 214.0/255.0, alpha: 1.0)

    static let customYellowColor = UIColor(red: 251.0/255.0, green: 144.0/255.0, blue: 12.0/255.0, alpha: 1.0)
}


extension UITextField {

    func isEmpty() -> Bool {
        if (self.text == "" || self.text == nil){
            return true
        }else {
            return false
        }
    }
}

extension Calendar {
    func getDayOfWeek(_ date: Date) -> Int {
        var dayOfWeek = self.component(.weekday, from: date) + 1 - self.firstWeekday
        
        if dayOfWeek <= 0 {
            dayOfWeek += 7
        }
        
        return dayOfWeek
    }

    func startOfWeek(_ date: Date) -> Date {
        return self.date(byAdding: DateComponents(day: -self.getDayOfWeek(date) + 1), to: date)!
    }
    
    func endOfWeek(_ date: Date) -> Date {
        return self.date(byAdding: DateComponents(day: 6), to: self.startOfWeek(date))!
    }
    
    func isToday(_ date: Date) -> Bool {
        return self.isDateInToday(date)
    }
}

extension NSDate {

    public func getDateForReset(_ day: Int, hour: Int, minute: Int,
                                cal: Calendar = Calendar.current) -> Date {
        // Get the Calendar in use
        let todaysComps = cal.dateComponents([.weekday, .hour, .minute], from: Date())
        // Get the relative components,
        // This is where the real magic happens, How much time between now  and our reset time
        // in days hours minutes
        var resetComps = DateComponents()
        
        if (day + 1) <= todaysComps.weekday! {  //adjust for week wrap.
            resetComps.weekday = (day + 1) - todaysComps.weekday! + 7
        } else {
            resetComps.weekday = (day + 1) - todaysComps.weekday!
        }
        resetComps.hour   = hour - todaysComps.hour!
        resetComps.minute = minute - todaysComps.minute!
        
        // Taking the above differences, add them to now
        let date = cal.date(byAdding: resetComps, to: Date())
        
        return date! //swiftlint:disable:this force_cast
    }

    public func hoursMinutesFromDate(date startDate: Date,
                                     toDate endDate: Date ) -> (hours: Int, minutes: Int) {
        let cal = Calendar.current
        let comps = cal.dateComponents([.hour, .minute], from: startDate, to: endDate)
        return (comps.hour!, comps.minute!)
    }

}
