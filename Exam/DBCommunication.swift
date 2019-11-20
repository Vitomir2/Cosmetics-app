//
//  DBCommunication.swift
//  Exam
//
//  Created by Vitomir on 2/11/17.
//  Copyright © 2017 Vitomir. All rights reserved.
//

import UIKit

class DBCommunication: NSObject {

    private var session: URLSession!
    var allDataItems: Set<String>! = Set<String>()
    
    static let instance: DBCommunication = DBCommunication()
    
    override init() {
        let sessionConfig = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    }
    
    func login (with username: String, password: String, completionHandler: @escaping (_ success: Bool) -> ()) {
        
        guard let URL = URL(string: "https://softuniswiftexam1.firebaseio.com/Vitomir/users/\(username)") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: { (data, response,
            error) -> Void in
            
            if (error == nil) {
                //Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                if statusCode == 200 {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any?]
                        guard let DBUsername = json["username"] as? String else {
                            completionHandler(false)
                            return
                        }
                        
                        guard let DBPassword = json["password"] as? String else {
                            completionHandler(false)
                            return
                        }
                        
                        if DBUsername == username && DBPassword == password {
                            completionHandler(true)
                            return
                        }
                        
                    }
                    catch {
                        
                    }
                }
                completionHandler(false)
            }
            else {
                //Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
    }
    
    func getInfoForItem(firstName: String, completion:@escaping (_ item: [String:Any?]?)->()) {
        guard let URL = URL(string: "https://softuniswiftexam1.firebaseio.com/Vitomir/users/Vitomir/\(firstName).json") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: { (data, response,
            error) -> Void in
            if (error == nil) {
                //Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                if statusCode == 200 {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any?]
                        completion(json)
                    }
                    catch {
                        completion(nil)
                    }
                }
                else {
                    completion(nil)
                }
            }
            else {
                completion(nil)
            }
        })
        task.resume()
    }
    
    func getAllInfo() {
        guard let URL = URL(string: "https://softuniswiftexam1.firebaseio.com/Vitomir/users/Vitomir/.json?shallow=true)") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: { (data, response,
            error) -> Void in
            if (error == nil) {
                //Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                if statusCode == 200 {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any?]
                        
                        for anItem in json {
                            self.allDataItems.insert(anItem.key)
                        }
                        
                        NotificationCenter.default.post(name: .DataReloaded, object: self)
                    }
                    catch {
                        
                    }
                }
            }
            else {
                //Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
    }
    
    func sendInfoToDB(info: [String: Any?]) {
        
        let name = info[Data.firstName.rawValue]
        
        guard var URL = URL(string: "https://softuniswiftexam1.firebaseio.com/Vitomir/users/Vitomir/\(name).json") else {return}
        
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        request.httpBody = try! JSONSerialization.data(withJSONObject: info, options: [])
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
    }

    
}
