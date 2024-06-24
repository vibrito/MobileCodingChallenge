//
//  LightiningService.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

import Foundation

func fetchData(completion: @escaping ([Node]?, Error?) -> Void) {
    
    let url = URL(string: "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity")!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            if let array = try JSONDecoder().decode([Node]?.self, from: data) {
                completion(array, nil)
            }
        } catch {
            completion(nil, error)
        }
    }
    task.resume()
}
