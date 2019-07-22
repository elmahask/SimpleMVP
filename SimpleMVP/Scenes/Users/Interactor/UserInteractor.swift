//
//  UserInteractor.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import Foundation

class UserInteractor {
    
    let session = URLSession.shared
    
    public func getAllUsers(completion:@escaping (User?,Error?)-> Void ){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                completion(nil,error)
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let user = try? JSONDecoder().decode(User.self, from: data!)
                //let json = try JSONSerialization.jsonObject(with: data!, options:[])
                print("user \(user![0].name)")
                print("user \(user!.count)")
                //print(json)
                completion(user,nil)
            } catch {
                completion(nil,error)
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
}
