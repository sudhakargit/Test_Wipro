//
//  MainParserObject.swift
//  someCreation
//
//  Created by Amit Chakraborty on 30/04/18.
//  Copyright © 2018 Amit Chakraborty. All rights reserved.
//

import UIKit

class MainParserObject: NSObject {
    
    class func callWebserviceForImage( handaler Completionhandeler: @escaping(_ result: Images) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: ""), arrValues: [], isloader: true) { (status, result) in
            if status
            {
                let arrList = try! JSONDecoder().decode(Images.self, from: result)
                Completionhandeler(arrList)
            }
        }
    }
}


