//
//  Extensions.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 11/09/23.
//

import Foundation

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
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)
        
        guard urlComponents != nil else {
            return nil
        }
        
        urlComponents!.queryItems = (urlComponents!.queryItems ?? []) +
            (parameters?.map { URLQueryItem(name: $0, value: $1) } ?? [])
        
        let trimmedPatch = patch.hasSuffix("/") ? String(patch.dropLast()) : patch
        
        urlComponents!.path = (urlComponents!.path + "/" + trimmedPatch).trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        
        return urlComponents!.url
    }
    
}
