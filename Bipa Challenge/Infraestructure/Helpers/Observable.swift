//
//  Observable.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

import Foundation

class Observable<T> {

    public typealias CompletionHandler = (T) -> Void
    
    private var completionHandler: CompletionHandler?

    var value: T {
        didSet {
            completionHandler?(value)
        }
    }

    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(completionHandler: CompletionHandler?) {
        self.completionHandler = completionHandler
        completionHandler?(value)
    }
}
