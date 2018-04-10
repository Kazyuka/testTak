// Short test playground for Curogram's iOS candidates.

import UIKit
import PlaygroundSupport

/**
 ---------------------------------------------------------------------------------
 How long are you in iOS coding?
 */
let iOSCodingSummary: TimeInterval = 1.8

print(iOSCodingSummary)



/**
 ---------------------------------------------------------------------------------
 How much Swift experience do you have?
 */
let swiftCodingTime: TimeInterval = 1.5

print(swiftCodingTime)



/**
 ---------------------------------------------------------------------------------
 Your favourite Swift frameworks
 */
let frameworks = [URL(string: "https://github.com/Alamofire/Alamofire/blob/master/Documentation/Alamofire%204.0%20Migration%20Guide.md"),URL(string: "https://github.com/rs/SDWebImage"), URL(string: "https://github.com/xmartlabs/Eureka")]

print(frameworks)

/**
 ---------------------------------------------------------------------------------
Please describe your opinion regarding coding with patterns
 */

//Of my point of view, We must use the patterns, since they make the code flexible and structured


/**
 ---------------------------------------------------------------------------------
 What are the most important skills for the developer, what do you think?
 Please provide an answer in the code manner e.g. array or something else.
 */

var skills = ["attention","perseverance","Ability to find the right information"]

print(skills)

/**
 ---------------------------------------------------------------------------------
 If you had a choice, would you use this "Factory" for creating UI controls or you would 
 like to make it another way. Justify your answer.
 */

enum LabelFactory {
    
    case standardLabel(text: String, textColor: UIColor, fontStyle: UIFontTextStyle, textAlignment: NSTextAlignment?, sizeToFit: Bool, adjustToFit: Bool)
    
    var new: UILabel {
        
        switch self {
        case .standardLabel(let text,let textColor,let fontStyle, let textAlignment,let sizeToFit, let adjustToFit):
            return createStandardLabel(text: text, textColor: textColor, fontStyle: fontStyle, textAlignment: textAlignment, sizeToFit: sizeToFit, adjustToFit: adjustToFit)
        }
    }
    
    private func createStandardLabel(text: String, textColor: UIColor, fontStyle: UIFontTextStyle, textAlignment: NSTextAlignment?, sizeToFit: Bool, adjustToFit: Bool) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = adjustToFit
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: fontStyle)
        label.textAlignment = textAlignment ?? .left
        label.textColor = textColor
        if sizeToFit {
            label.sizeToFit()
        }
        return label
    }
}


/// *** Answer and/or implementation goes here ***

//Maybe, I just extend class uilabel like
extension UILabel {
    
    func standardLabel(text: String, textColor: UIColor, fontStyle: UIFontTextStyle, textAlignment: NSTextAlignment?, sizeToFit: Bool, adjustToFit: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontSizeToFitWidth = adjustToFit
        self.text = text
        self.font = UIFont.preferredFont(forTextStyle: fontStyle)
        self.textAlignment = textAlignment ?? .left
        self.textColor = textColor
        if sizeToFit {
            self.sizeToFit()
        }
    }
}



/**
 ---------------------------------------------------------------------------------
 OPTIONAL QUESTION (so you can ignore it if you are too busy or something)
 Synchronize an execution of these three operations. They should be executed one right after another. As a result, you need to output all functions results in a reversed order into existing value.
 */

let queue = OperationQueue()
queue.maxConcurrentOperationCount = Int(Int8.max)

func operation1(with parameter: String, and completion: @escaping ((String) -> Void)) {
    queue.addOperation { 
        Thread.sleep(forTimeInterval: 0.1)
        completion(parameter)
    }
}

func operation2(with amount: UInt, and completion: @escaping ((String) -> Void)) {
    DispatchQueue.global().async {
        var result: UInt = 0
        for i in 0 ..< amount {
            Thread.sleep(forTimeInterval: 0.1)
            result += i
        }
        completion(String(describing: result))
    }
}

let operation3: ((String) -> String) = { (inStr) -> String in
    return inStr
}

/// Main function
func main() {
    /// WARNING: this value can NOT be modified inside any other queue!
    var result = [String]()
    
    // **** Your code goes here ****
    
    print(result)
}

main()





/**
 ---------------------------------------------------------------------------------
 Create a single screen standalone app.
 - There should be a List on the screen, progress indicator and "Add" button. How it should look - decide by yourself.
 - That List contains numbers, and it should be sorted from the highest value to lowest. Cells UI is on your choise.
 - By pressing "Add" button, there should be a random number generated (from 0 to 100 ) and added to the List. Delay when adding should be equal to 2 seconds. There should be a load indicator shown during delay.
 - "Swipe-to-delete" should be used to remove List items. There should be an "Undo" button somewhere on the screen. By pressing that button, last removed item should be brought back to the list. Delay when restoring should be equal to 2 seconds. There should be a load indicator shown during delay.
 - When adding new items, UI should not be blocked. There should be a support for multiple items adding\restoring in the same time.
 */


