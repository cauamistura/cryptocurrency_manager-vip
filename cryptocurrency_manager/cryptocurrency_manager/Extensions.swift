//
//  Extensions.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 11/09/23.
//

import UIKit

extension URL {
    
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else { return nil }
        
        var items: [String: String] = [:]
        
        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }
        
        return items
    }
    
    func appendingQueryParameters(patch: String, parameters: [String: String]? = nil) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {return nil}
        
        guard let parameters = parameters else {
            guard let url = urlComponents.url else {return nil}
            return url.appendingPathComponent(patch)
        }
        
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + parameters.map { URLQueryItem(name: $0, value: $1) }
        guard let url = urlComponents.url else { return nil }
        return url.appendingPathComponent(patch)
    }
}

extension Error {
    var errorCode: Int? {
        return (self as NSError).code
    }
}

extension UIImageView {
    func loadImage(from url: String) {
        guard let url = URL(string: url) else {return}
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } catch {}
        }
    }
}
