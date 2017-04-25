//
//  Article+CoreDataProperties.swift
//  diary
//
//  Created by Scott on 21/4/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import Foundation
import CoreData

extension Article {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }
    
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var createdAt: NSDate?
}
