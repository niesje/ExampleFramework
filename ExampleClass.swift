//
//  ExampleClass.swift
//  ExampleFramework
//
//  Created by Niesje Dowell on 9/7/16.
//
//

import Foundation
import Alamofire
import AlamofireImage

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
    public typealias Color = UIColor
#elseif os(OSX)
    import Cocoa
    public typealias Color = NSColor
#endif

public class ExampleFramework {

    public class func getNetworkImage(url: String, completion: (Image? -> Void)) -> Request {
        return Alamofire.request(.GET, url).responseImage { response in
            print("first")
            guard let image = response.result.value else {
                completion(nil)
                return
            }
            completion(image)
        }
    }
    
    public class func getRandomColor() -> Color {
        let colors = [Color.redColor(), Color.orangeColor(), Color.yellowColor(), Color.greenColor(), Color.blueColor()]
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        print("second")
        return colors[randomIndex]
    }
    
}