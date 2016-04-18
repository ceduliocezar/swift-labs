//
//  DataModel.swift
//  AwesomeLists
//
//  Created by Cedulio Cezar on 18/04/16.
//  Copyright © 2016 Cedulio Cezar. All rights reserved.
//

import Foundation


class DataModel{
    var lists = [Checklist]()
    
    var indexOfSelectedChecklist: Int {
        get {
            return NSUserDefaults.standardUserDefaults().integerForKey( "ChecklistIndex")
        }
        set {
            NSUserDefaults.standardUserDefaults().setInteger(newValue, forKey: "ChecklistIndex")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    init(){
        loadChecklistsItems()
        registerDefaults()
        print("Documents folder is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
    }
    
    
    func documentsDirectory() ->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        return paths[0]
    }
    
    func dataFilePath() -> String{
        return (documentsDirectory() as NSString).stringByAppendingPathComponent("Checklists.plists")
    }
    
    func saveChecklists(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadChecklistsItems(){
        let path = dataFilePath()
        
        if NSFileManager.defaultManager().fileExistsAtPath(path){
            if let data  =  NSData(contentsOfFile: path){
                let unarchiver =  NSKeyedUnarchiver(forReadingWithData: data)
                if let object = unarchiver.decodeObjectForKey("Checklists"){
                    lists = object as! [Checklist]
                }
                
                unarchiver.finishDecoding()
            }
        }
    }
    
    func registerDefaults() {
        let dictionary = [ "ChecklistIndex": -1 ]
        NSUserDefaults.standardUserDefaults().registerDefaults(dictionary) }
}