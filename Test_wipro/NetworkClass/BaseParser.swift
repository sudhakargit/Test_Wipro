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
    
    return "\("https://fleetmanagement.astiinfotech.com/")\(str)" // LIVE SERVER
    //return "\("http://209.126.113.224:8011/")\(str)"
    //return "\("http://192.168.0.15:8018/")\(str)"
    
}
func APP_VERSION() -> String {
    
    
    let strAppVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    return strAppVersion
}

class BaseParser: NSObject {
    
    class func callWebservice( serviceUrl: String, postValues: [String:AnyObject], methodname: String, isloader: Bool, headerType: ContentTypeHeader, complititionhandeler: @escaping(_ status: Bool, _ resultJson: Any) -> Void)
    {
        print("Sent Value for url: \(serviceUrl) \(postValues)")
        if isloader {
            Loader.shared.show()
        }
        guard let url = URL(string: serviceUrl) else {
            print("url not found")
            return
        }
        var requestJson = URLRequest(url: url)
        requestJson.httpMethod = methodname
        requestJson.addValue(headerType.rawValue, forHTTPHeaderField: "Content-Type")
        var httBody: Data? = nil
        if headerType == ContentTypeHeader.urlEncoded
        {
            let str = self.stringFromDictionary(dict: postValues as? [String : AnyHashable] ?? [:])
            print(str)
            httBody = str.data(using: .utf8)
        }
        else
        {
            httBody = try? JSONSerialization.data(withJSONObject: postValues, options: [])
        }
//        requestJson.addValue(APP_VERSION(), forHTTPHeaderField: "AppVersion")
//        requestJson.addValue(UserDefaults.standard.value(forKey: kAccessToken) as? String ?? "", forHTTPHeaderField: "Token")
//        requestJson.addValue("*/*", forHTTPHeaderField: "Accept")
        requestJson.httpBody = httBody
        let session = URLSession.shared
            session.dataTask(with: requestJson) { (data, reponce, error) in
                if let responce : HTTPURLResponse = reponce as? HTTPURLResponse {
                print(responce.statusCode)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("responce for url: \(requestJson) \(json)")
                    DispatchQueue.main.sync {
                    complititionhandeler(true, json as Any)
                    Loader.shared.hide()
                    }
                }
                catch
                {
                    print("responce for url: \(requestJson) \(error)")
                    DispatchQueue.main.sync {
                        complititionhandeler(false, error as Any)
                        Loader.shared.hide()
                    }
                }
            }
        }.resume()
    }
    class func callGetWebservice( serviceUrl: String, arrValues: [String], isloader: Bool, complititionhandeler: @escaping(_ status: Bool, _ resultJson: Data) -> Void)
    {
        if isloader {
            Loader.shared.show()
        }
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
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("responce for url: \(serviceUrl + values) \(json)")
                    DispatchQueue.main.sync {
                        Loader.shared.hide()
                        complititionhandeler(true, data)
                    }
                } catch{
                    DispatchQueue.main.sync {
                        Loader.shared.hide()
                        print(error)
                    }
                }
            }
        }.resume()
    }
    class func callGetWebserviceJson( serviceUrl: String, arrValues: [String], isloader: Bool, complititionhandeler: @escaping(_ status: Bool, _ resultJson: Any) -> Void)
    {
        if isloader {
            Loader.shared.show()
        }
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
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("responce for url: \(serviceUrl + values) \(json)")
                    DispatchQueue.main.sync {
                        Loader.shared.hide()
                        complititionhandeler(true, json)
                    }
                } catch{
                    DispatchQueue.main.sync {
                        Loader.shared.hide()
                        print(error)
                    }
                }
            }
            }.resume()
    }

    class func callWebserviceForData( serviceUrl: String, postValues: [String:AnyObject], methodname: String, isloader: Bool, headerType: ContentTypeHeader, complititionhandeler: @escaping(_ status: Bool, _ resultJson: Data) -> Void)
    {
        print("Sent Value for url: \(serviceUrl) \(postValues)")
        if isloader {
            Loader.shared.show()
        }
        guard let url = URL(string: serviceUrl) else {
            print("url not found")
            return
        }
        var requestJson = URLRequest(url: url)
        
        requestJson.httpMethod = methodname
        requestJson.addValue(headerType.rawValue, forHTTPHeaderField: "Content-Type")
        var httBody: Data? = nil
        if headerType == ContentTypeHeader.urlEncoded
        {
            let str = self.stringFromDictionary(dict: postValues as? [String : AnyHashable] ?? [:])
            print(str)
            httBody = str.data(using: .utf8)
        }
        else
        {
            httBody = try? JSONSerialization.data(withJSONObject: postValues, options: [])
        }
        requestJson.addValue(APP_VERSION(), forHTTPHeaderField: "AppVersion")
        requestJson.addValue(UserDefaults.standard.value(forKey: kAccessToken) as? String ?? "", forHTTPHeaderField: "Token")
        requestJson.addValue("*/*", forHTTPHeaderField: "Accept")
        requestJson.httpBody = httBody
        let session = URLSession.shared
        session.dataTask(with: requestJson) { (data, reponce, error) in
            if let responce : HTTPURLResponse = reponce as? HTTPURLResponse {
                print(responce.statusCode)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("responce for url: \(requestJson) \(json)")
                    DispatchQueue.main.sync {
                        complititionhandeler(true, data)
                        Loader.shared.hide()
                    }
                }
                catch
                {
                    print("responce for url: \(requestJson) \(error)")
                    DispatchQueue.main.sync {
                        //complititionhandeler(false, error as Any)
                        Loader.shared.hide()
                    }
                }
            }
            }.resume()
    }
    class func stringFromDictionary(dict: [String: AnyHashable]) -> (String)
    {
        var arr = [String]()
        for (key, value) in dict {
            print("\(key)=\(value)")
            arr.append("\(key)=\(value)")
        }
        let strData = arr.joined(separator: "&")
        return strData
    }
}
extension Error {
    
    var isConnectivityError: Bool {
        // let code = self._code || Can safely bridged to NSError, avoid using _ members
        let code = (self as NSError).code
        
        if (code == NSURLErrorTimedOut) {
            return true // time-out
        }
        
        if (self._domain != NSURLErrorDomain) {
            return false // Cannot be a NSURLConnection error
        }
        
        switch (code) {
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost, NSURLErrorCannotConnectToHost:
            return true
        default:
            return false
        }
    }
    
}
