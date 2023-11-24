//
//  Activities.swift
//  Tourist_Activities
//
//  Created by Patel Chintan on 2023-03-01.
//

import Foundation
class Activities : Identifiable , ObservableObject{
    
    var id = UUID()
    var image : String
    var activitytitle : String
    var price : Int
    var image2:String
    var deails:String
    var ratings:String
    var contact:String
    var image3:String
    
    init() {
        self.image = ""
        self.activitytitle = ""
        self.price = 0
        self.image2 = ""
        self.deails = ""
        self.ratings = ""
        self.contact = ""
        self.image3 = ""
        
    }
    
    init(id: UUID = UUID(), image: String, activitytitle: String, price: Int, image2: String, deails: String, ratings: String, contact: String, image3:String) {
        self.id = id
        self.image = image
        self.activitytitle = activitytitle
        self.price = price
        self.image2 = image2
        self.deails = deails
        self.ratings = ratings
        self.contact = contact
        self.image3 = image3
    }
   
}

