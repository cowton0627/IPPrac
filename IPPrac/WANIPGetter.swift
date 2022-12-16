//
//  WANIPGetter.swift
//  IPPrac
//
//  Created by Chun-Li Cheng on 2022/12/16.
//

import Foundation

class WANIPGetter: NSObject {
    
    /// 獲得廣域網 IP
    static func getPublicIP(callback: @escaping ((String) -> ())) {
        let queue = OperationQueue()
        let blockOP = BlockOperation.init {
            
            if let url = URL(string: "https://api.ipify.org/?format=json"),
               let string = try? String(contentsOf: url, encoding: .utf8) {

                print("data:\(string)")
                
                let array = string.components(separatedBy: ":")
                print(array)
                
                // 保證 IP 位置有值
                if array.count > 1  {
                    // 拿掉不必要的字符
                    let ipString = array[1].replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "}", with: "")
                    
                    DispatchQueue.main.async {
                        callback(ipString)
                    }
                    // 成功獲取必須 return
                    return
                                        
                }
                
            } else {
                    
                print("獲取廣域廣 IP URL 轉換失敗")
            }
            
            DispatchQueue.main.async {
                print("獲取廣域網 IP 失敗")
                callback("")
            }
                 
        }
        queue.addOperation(blockOP)
    }

}
