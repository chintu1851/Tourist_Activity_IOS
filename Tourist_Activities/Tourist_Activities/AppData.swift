//
//  AppData.swift
//  Tourist_Activities
//
//  Created by Harshil Vaghani on 2023-03-05.
//

import Foundation
class AppData: ObservableObject{
    
    @Published var mylist:[String]

    init(mylist: [String]) {
        
        self.mylist = mylist
    }
    init(){
        self.mylist = []
    }
}
