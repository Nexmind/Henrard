//
//  WebService.swift
//  henrard
//
//  Created by Julien Henrard on 18/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import Foundation


public class WebService {
    
    var endPointUrl = ""
    
    init(url: String){
        self.endPointUrl = url
    }
    
    public func get(_ url: String, headers: [String: String]?, timeOut: TimeInterval?, withBehavior responseHandler: @escaping (Data?, Int) -> Void){
        let wsUrl: String = "\(self.endPointUrl)\(url)"
        guard let NSUrl = URL(string: wsUrl) else {
            NSLog("---< !!! ERROR !!! >--- WebService (GET) \'\(url)\': cannot create URL")
            return
        }
        let urlRequest = NSMutableURLRequest(url: NSUrl)
        urlRequest.httpMethod = "GET"
        urlRequest.timeoutInterval = timeOut == nil ? 5 : timeOut!
        if headers != nil {
            for param in headers! {
                urlRequest.addValue(param.value, forHTTPHeaderField: param.key)
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            guard data != nil else {
                NSLog("---< ! WARNING ! >--- WebService (GET) \'\(url)\': did not receive data - \(error)")
                responseHandler(nil, 0)
                return
            }
            guard error == nil else {
                NSLog("---< !!! ERROR !!! >--- WebService (GET) \'\(url)\': calling GET on the given method (verify URL)")
                return
            }
            NSLog("|| WebService (GET) \'\(url)\' || ---> SUCCESS")
            responseHandler(data, (response as! HTTPURLResponse).statusCode)
            return
        }
        task.resume()
    }
    
    
    public func post(_ url: String, headers: [String: String]?, body: String, timeOut: TimeInterval?, withBehavior responseHandler: @escaping (Data?, Int) -> Void){
        let wsUrl: String = "\(self.endPointUrl)\(url)"
        guard let NSUrl = URL(string: wsUrl) else {
            NSLog("---< !!! ERROR !!! >--- WebService (POST) \'\(url)\': cannot create URL")
            return
        }
        let urlRequest = NSMutableURLRequest(url: NSUrl)
        urlRequest.httpBody = body.data(using: String.Encoding.isoLatin1, allowLossyConversion: true)
        urlRequest.httpMethod = "POST"
        urlRequest.timeoutInterval = timeOut == nil ? 5 : timeOut!
        if headers != nil {
            for param in headers! {
                urlRequest.addValue(param.value, forHTTPHeaderField: param.key)
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            guard data != nil else {
                NSLog(error?.localizedDescription ?? "")
                NSLog("---< ! WARNING ! >--- WebService (POST) \'\(url)\': did not receive data")
                responseHandler(nil, 0)
                return
            }
            guard error == nil else {
                NSLog("---< !!! ERROR !!! >--- WebService (POST) \'\(url)\': calling GET on the given method (verify URL)")
                return
            }
            NSLog("|| WebService (POST) \'\(url)\' || ---> SUCCESS")
            responseHandler(data, (response as! HTTPURLResponse).statusCode)
            return
        }
        task.resume()
    }
    
    
    public func put(_ url: String, headers: [String: String]?, body: String, withBehavior responseHandler: @escaping (Data?, Int) -> Void){
        let wsUrl: String = "\(self.endPointUrl)\(url)"
        guard let NSUrl = URL(string: wsUrl) else {
            NSLog("---< !!! ERROR !!! >--- WebService (PUT) \'\(url)\': cannot create URL")
            return
        }
        let urlRequest = NSMutableURLRequest(url: NSUrl)
        urlRequest.httpBody = body.data(using: String.Encoding.utf8, allowLossyConversion: true)
        urlRequest.httpMethod = "PUT"
        urlRequest.timeoutInterval = 10
        if headers != nil {
            for param in headers! {
                urlRequest.addValue(param.value, forHTTPHeaderField: param.key)
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            guard data != nil else {
                NSLog("---< ! WARNING ! >--- WebService (PUT) \'\(url)\': did not receive data")
                responseHandler(nil, 0)
                return
            }
            guard error == nil else {
                NSLog("---< !!! ERROR !!! >--- WebService (PUT) \'\(url)\': calling GET on the given method (verify URL)")
                return
            }
            NSLog("|| WebService (PUT) \'\(url)\' || ---> SUCCESS")
            responseHandler(data, (response as! HTTPURLResponse).statusCode)
            return
        }
        task.resume()
    }
    
    public func delete(_ url: String, headers: [String: String]?, body: String, timeOut: TimeInterval?, withBehavior responseHandler: @escaping (Data?, Int) -> Void){
        let wsUrl: String = "\(self.endPointUrl)\(url)"
        guard let NSUrl = URL(string: wsUrl) else {
            NSLog("---< !!! ERROR !!! >--- WebService (DELETE) \'\(url)\': cannot create URL")
            return
        }
        let urlRequest = NSMutableURLRequest(url: NSUrl)
        urlRequest.httpMethod = "DELETE"
        urlRequest.httpBody = body.data(using: String.Encoding.utf8, allowLossyConversion: true)
        urlRequest.timeoutInterval = timeOut == nil ? 5 : timeOut!
        if headers != nil {
            for param in headers! {
                urlRequest.addValue(param.value, forHTTPHeaderField: param.key)
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            guard data != nil else {
                NSLog("---< ! WARNING ! >--- WebService (DELETE) \'\(url)\': did not receive data")
                responseHandler(nil, 0)
                return
            }
            guard error == nil else {
                NSLog("---< !!! ERROR !!! >--- WebService (DELETE) \'\(url)\': calling DELETE on the given method (verify URL)")
                return
            }
            NSLog("|| WebService (DELETE) \'\(url)\' || ---> SUCCESS")
            responseHandler(data, (response as! HTTPURLResponse).statusCode)
            return
        }
        task.resume()
    }
}

