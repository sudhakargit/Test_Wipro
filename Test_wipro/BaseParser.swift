//
//  BaseParser.swift
//  someCreation
//
//  Created by Amit Chakraborty on 30/04/18.
//  Copyright © 2018 Amit Chakraborty. All rights reserved.
//

import Foundation
import UIKit

func APP_SERVICE(str: String) -> String {
    return "\("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")\(str)" // LIVE SERVER
}
class BaseParser: NSObject {
    
    class func callGetWebservice( serviceUrl: String, arrValues: [String], isloader: Bool, complititionhandeler: @escaping(_ status: Bool, _ resultJson: Data) -> Void)
    {

        let values = arrValues.joined(separator: "/")
        guard let url = URL(string: serviceUrl + values) else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, responce, error) in
            if let responce : HTTPURLResponse = responce as? HTTPURLResponse {
                    print(responce.statusCode)
            }
            if let data = data{
                do{
                    let responseStrInISOLatin = String(data: data, encoding: String.Encoding.isoLatin1)
                    guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                        print("could not convert data to UTF-8 format")
                        return
                    }
                    do {
                        let responseJSONDict = try JSONSerialization.jsonObject(with: modifiedDataInUTF8Format)
                        print(responseJSONDict)
                        DispatchQueue.main.sync {
                            complititionhandeler(true, modifiedDataInUTF8Format)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }.resume()
    }
}
