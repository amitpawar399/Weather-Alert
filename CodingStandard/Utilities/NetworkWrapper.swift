//
//  NetworkWrapper.swift
//  AlmofireWrapper
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import Foundation
import Alamofire
import PKHUD
open class NetworkWrapper {
    
    
    typealias CompletionHandler = (_ Respones: Respones) -> Void
    static func request(url : String, method : HTTPMethod, parameter :  [String: Any] ,encoding : Encoding, headers: Header, loader: String, responsType : ResponesType, completionHandler : @escaping CompletionHandler) {
        
        let manager = NetworkReachabilityManager(host: "www.google.com")
        
        
        if (manager!.isReachable == true){
            
            // loader
            self.loaderManger(msg: loader, showLoader: true)
            
            // header selection
            var currentHeader = [String : String]()
            
            if(headers == Header.headersImage){
                
                currentHeader = HeadersImage
                
            }else {
                
                currentHeader =  NetworkWrapper().HeaderDefault
                
            }
            //encoding
            var currentEncoding : JSONEncoding
            
            
            if(encoding == Encoding.jsonEncoding){
                
                currentEncoding = JSONEncoding.default
                
            }else {
                
                currentEncoding = JSONEncoding.default
                
            }
            
            if (method == HTTPMethod.post) {
                
                if(responsType == ResponesType.json){
                    
                    Alamofire.request(url, method: .post , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseJSON { response in
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        if(responesObj.statusCode == 429){
                            
                            self.loaderManger(msg: loader, showLoader: false)
                        } else {
                            
                            switch response.result {
                                
                            case .success:
                                
                                if let array : [[String: AnyObject]] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [[String: AnyObject]] {
                                    
                                    responesObj.valueArray = array
                                }
                                
                                if let mDictionary : [String: AnyObject] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String: AnyObject] {
                                    responesObj.valueDictionary = mDictionary
                                    
                                }
                                
                                if let mString  : String = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? String {
                                    responesObj.valueString = mString
                                }
                                
                                responesObj.isSuccessfull = true
                                
                                // loader
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break
                                
                            case .failure(let error):
                                print(error)
                                responesObj.isSuccessfull = false
                                // loader
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break
                                
                            }
                        }
                    }
                } else if(responsType == ResponesType.text){
                    
                    Alamofire.request(url, method: .post , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseString(completionHandler: { (response) in
                        
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        if (responesObj.statusCode == 200) {
                            
                            responesObj.isSuccessfull = true
                            
                        }
                        if(responesObj.statusCode == 429){
                            
                            self.loaderManger(msg: loader, showLoader: false)
                        } else {
                            
                            responesObj.valueString =  response.result.value
                            
                            self.loaderManger(msg: loader, showLoader: false)
                            completionHandler(responesObj)
                            
                        }
                    })
                    
                }
            }else if (method == HTTPMethod.post) {
                
                if(responsType == ResponesType.json){
                    
                    Alamofire.request(url, method: .post , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseJSON { response in
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        if(responesObj.statusCode == 429){
                            
                            
                            self.loaderManger(msg: loader, showLoader: false)
                        } else {
                            
                            switch response.result {
                                
                            case .success:
                                
                                if let array : [[String: AnyObject]] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [[String: AnyObject]] {
                                    
                                    responesObj.valueArray = array
                                }
                                
                                if let mDictionary : [String: AnyObject] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String: AnyObject] {
                                    responesObj.valueDictionary = mDictionary
                                    
                                }
                                
                                if let mString  : String = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? String {
                                    responesObj.valueString = mString
                                    
                                }
                                
                                responesObj.isSuccessfull = true
                                
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break
                                
                            case .failure(let error):
                                print(error)
                                responesObj.isSuccessfull = false
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break
                                
                            }
                        }
                    }
                } else if(responsType == ResponesType.text){
                    
                    Alamofire.request(url, method: .post , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseString(completionHandler: { (response) in
                        
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        
                        if (responesObj.statusCode == 200) {
                            
                            responesObj.isSuccessfull = true
                            
                        }
                        
                        responesObj.valueString =  response.result.value
                        
                        self.loaderManger(msg: loader, showLoader: false)
                        completionHandler(responesObj)
                    })
                    
                }
            }else if (method == HTTPMethod.patch) {
                
                if(responsType == ResponesType.json){
                    
                    Alamofire.request(url, method: .patch , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseJSON { response in
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        if(responesObj.statusCode == 429){
                            
                            self.loaderManger(msg: loader, showLoader: false)
                        } else {
                            
                            switch response.result {
                                
                            case .success:
                                
                                if let array : [[String: AnyObject]] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [[String: AnyObject]] {
                                    
                                    responesObj.valueArray = array
                                }
                                
                                if let mDictionary : [String: AnyObject] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String: AnyObject] {
                                    responesObj.valueDictionary = mDictionary
                                    
                                }
                                
                                if let mString  : String = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? String {
                                    responesObj.valueString = mString
                                    
                                }
                                
                                responesObj.isSuccessfull = true
                                
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break
                                
                            case .failure(let error):
                                print(error)
                                responesObj.isSuccessfull = false
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break 
                            }
                        }
                    }
                } else if(responsType == ResponesType.text){
                    
                    Alamofire.request(url, method: .patch , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseString(completionHandler: { (response) in
                        
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        
                        if (responesObj.statusCode == 200) {
                            
                            responesObj.isSuccessfull = true
                            
                        }
                        
                        responesObj.valueString =  response.result.value
                        
                        self.loaderManger(msg: loader, showLoader: false)
                        completionHandler(responesObj)
                    })
                    
                }
            }else if (method == HTTPMethod.put) {
                
                if(responsType == ResponesType.json){
                    
                    Alamofire.request(url, method: .put , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseJSON { response in
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        if(responesObj.statusCode == 429){
                            
                            self.loaderManger(msg: loader, showLoader: false)
                        } else {
                            
                            switch response.result {
                                
                            case .success:
                                
                                if let array : [[String: AnyObject]] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [[String: AnyObject]] {
                                    
                                    responesObj.valueArray = array
                                }
                                
                                if let mDictionary : [String: AnyObject] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String: AnyObject] {
                                    responesObj.valueDictionary = mDictionary
                                    
                                    
                                }
                                
                                if let mString  : String = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? String {
                                    responesObj.valueString = mString
                                    
                                }
                                
                                responesObj.isSuccessfull = true
                                
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break
                                
                            case .failure(let error):
                                print(error)
                                responesObj.isSuccessfull = false
                                self.loaderManger(msg: loader, showLoader: false)
                                completionHandler(responesObj)
                                break
                                
                            }
                        }
                    }
                } else if(responsType == ResponesType.text){
                    
                    Alamofire.request(url, method: .put , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseString(completionHandler: { (response) in
                        
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        
                        if (responesObj.statusCode == 200) {
                            
                            responesObj.isSuccessfull = true
                            
                        }
                        
                        responesObj.valueString =  response.result.value
                        
                        self.loaderManger(msg: loader, showLoader: false)
                        completionHandler(responesObj)
                    })
                    
                }
            }else if (method == HTTPMethod.get) {
                
                Alamofire.request(url, method: .get , parameters: nil , encoding: currentEncoding, headers: currentHeader ).responseJSON { response in
                    let responesObj = Respones()
                    
                    if (response.response != nil){
                        responesObj.statusCode = (response.response?.statusCode)!
                    }
                    
                    if(responesObj.statusCode == 429){
                        
                        
                        self.loaderManger(msg: loader, showLoader: false)
                    } else {

                        switch response.result {

                        case .success:

                            if let array : [[String: AnyObject]] = try! JSONSerialization.jsonObject(with:  response.data!  , options: .allowFragments) as? [[String: AnyObject]] {
 
                                responesObj.valueArray = array

                            }
                            
                            if let mDictionary : [String: AnyObject] = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String: AnyObject] {
                                responesObj.valueDictionary = mDictionary

                            }
                            
                            if let mString  : String = try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? String {
                                responesObj.valueString = mString

                            }
                            
                            responesObj.isSuccessfull = true

                            self.loaderManger(msg: loader, showLoader: false)
                            completionHandler(responesObj)
                            break
                            
                        case .failure(let error):
                            //  [Utility .hideMessage(self.view)]
                            print(error)
                            responesObj.isSuccessfull = false
                            // loader
                            self.loaderManger(msg: loader, showLoader: false)
                            completionHandler(responesObj)
                            break
                            
                        }
                        }
 
                    }
                    
                }else if (method == HTTPMethod.delete) {
                
                    Alamofire.request(url, method: .delete , parameters: parameter , encoding: currentEncoding, headers: currentHeader ).responseString(completionHandler: { (response) in
                        
                        let responesObj = Respones()
                        if (response.response != nil){
                            responesObj.statusCode = (response.response?.statusCode)!
                        }
                        
                        if (responesObj.statusCode == 200) {
                            
                            responesObj.isSuccessfull = true
                            
                        }
                        
                        responesObj.valueString =  response.result.value
                        
                        
                        // loader
                        self.loaderManger(msg: loader, showLoader: false)
                        completionHandler(responesObj)
                    })
                    
                }
        
        }else {
            HUD.flash(.labeledError(title: nil, subtitle: "ERROR IN NETWORK"), delay: 5)
        }
    }
    static func loaderManger(msg : String , showLoader : Bool) {
        
        if (showLoader == true) {
            
            if(msg.characters.count > 1) {
                
                HUD.show(.labeledProgress(title: nil, subtitle: msg ))
            } else if (msg == " ") {
                
                HUD.show(.labeledProgress(title: nil, subtitle: "Loading..." ))
                
            }else if (msg.characters.count == 0) {
  
            }
     
        } else {
            
            if(msg.characters.count > 1) {
                
                HUD.flash(.labeledProgress(title: nil, subtitle: msg ))
            } else if (msg == " ") {
                
                HUD.flash(.labeledProgress(title: nil, subtitle: "Loading..." ))
                
            }else if (msg.characters.count == 0) {
                
            }
        }
    }
    
    //header
    let HeaderDefault = [
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
    static let HeadersImage = [
        "Content-Type": "image/png",
        ]
    public enum HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    public enum Encoding : String {
        case dafaultEncoding = "dafault"
        case jsonEncoding = "json"
    }
    public enum Header : String {
        case headerDefault = "headerDefault"
        case headersImage = "headersImage"
    }
    public enum ResponesType : String {
        case text = "text"
        case json = "json"
    }
}
