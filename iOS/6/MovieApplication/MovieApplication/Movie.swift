/*
* Copyright 2016 Gowtham Ganesh Nayak,
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* Purpose: Assignment 4 Submission
* This example demonstrates Table View and Picker
* SER 598 Mobile Applications
* @author gnayak2@asu.edu
* @version March 2016
*/

import Foundation


// This class is Movie Class which hold movie descriptions
class Movie {
    var title: String
    var year: String
    var rated: String
    var released: String
    var actors: String
    var genre: String
    var plot: String
    
    init (jsonString: String) {
        
        self.title = "dummy"
        self.rated = "dummy"
        self.released = "dummy"
        self.actors = "dummy"
        self.genre = "dummy"
        self.plot = "dummy"
        self.year = "dummy"
        
        if let data: NSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
            do{
                let dict = try NSJSONSerialization.JSONObjectWithData(data, options:.MutableContainers) as! [String:AnyObject]
                self.title = dict["Title"] as! String
                self.year = dict["Year"] as! String
                self.rated = dict["Rated"] as! String
                self.released = dict["Released"] as! String
                self.genre = dict["Genre"] as! String
                self.actors = dict["Actors"] as! String
                self.plot = dict["Plot"] as! String
            } catch {
                print("unable to convert to dictionary")
                
            }
        }
    }
    
    init(title:String, rated:String, released:String, actors:String, genre:String, plot:String, year:String) {
        self.title = title
        self.rated = rated
        self.released = released
        self.actors = actors
        self.genre = genre
        self.plot = plot
        self.year = year
    }
    
    func toJsonString() -> String {
        var jsonStr = "";
        let dict = ["Title": self.title, "Year": year, "Rated": self.rated, "Released": self.released, "Genre": self.genre, "Actors": self.actors,"Plot": self.plot, "Runtime": "default"]
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(rawValue: 0))
            // here "jsonData" is the dictionary encoded in JSON data
            jsonStr = NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
        } catch let error as NSError {
            print(error)
        }
        return jsonStr
    }
    
    init (name: String, year: String, rated: String, released: String, genre: String, actors: String, plot: String) {
        self.title = name
        self.year = year
        self.rated = rated
        self.released = released
        self.actors = actors
        self.genre = genre
        self.plot = plot
    }
    func toDict() -> [String: String]{
        var  movieDict:[String: String] = [String: String]()
        movieDict["Title"] = self.getTitle()
        movieDict["Rated"] = self.getRated()
        movieDict["Released"] = self.getReleased()
        movieDict["Actors"] =  self.getActors()
        movieDict["Genre"] = self.getGenre()
        movieDict["Plot"] = self.getPlot()
        movieDict["Year"] = self.getYear()
        return movieDict
    }
    
    func getGenre() -> String {
        return self.genre
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getPlot() -> String {
        return self.plot
    }
    
    func getYear() -> String {
        return self.year
    }
    
    func getRated() -> String  {
        return self.rated
    }
    
    func getReleased() -> String  {
        return self.released
    }
    
    func getActors() -> String  {
        return self.actors
    }
    func setGenre(genre: String) {
        self.genre = genre
    }
    
    func setTitle(title: String){
        self.title = title
    }
    
    func setPlot(plot: String){
        self.plot = plot
    }
    
    func setYear(year: String){
        self.year = year
    }
    
    func setRated(rated: String){
        self.rated = rated
    }
    
    func setReleased(released: String) {
        self.released = released
    }
    
    func setActors(actors: String) {
        self.actors = actors
    }
}