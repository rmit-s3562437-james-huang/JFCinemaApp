//
//  Rest.swift
//  JFCinemaApp
//
//  Created by James Huang on 16/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation
import UIKit

class Rest {
    let session = URLSession.shared
    
    //https://api.themoviedb.org/3/discover/movie?api_key=fcefd09b157f66960bf7326639ed19c7&release_date.gte=2017-03-01&release_date.lte=2017-03-20&sort_by=popularity.desc
    
    // Constants for building various url requests to the service
    let BASE_URL: String = "https://api.themoviedb.org/3/"
    let SEARCH_MOVIE:String = "search/movie"
    let MOVIE_DETAILS:String = "movie/"
    let IMAGES_LOCATION = "images"
    // You will need to add your own API Key here
    let API_KEY:String = "?api_key=\(AppDelegate.key)"
    var ID_LENGTH:Int = 4
    
    var image: UIImageView!
    var movie_name: UILabel!
    
    var moviesArray: Array<Any>!
    
    //var sema = DispatchSemaphore( value: 0 )
    
    init() {
        getMovie()
    }
    
    func getMovie(){
        
        //let movieTitle:String = movie_name.text!.escapedParameters()
        //let findMovieId = BASE_URL + SEARCH_MOVIE + API_KEY + "&" + movieTitle
        
        //https://api.themoviedb.org/3/discover/movie?api_key=fcefd09b157f66960bf7326639ed19c7
        
        let latestMovies = "https://api.themoviedb.org/3/discover/movie?api_key=fcefd09b157f66960bf7326639ed19c7&release_date.gte=2017-03-01&release_date.lte=2017-03-20&sort_by=popularity.desc"
        
        if let url = URL(string: latestMovies)
        {
            let request = URLRequest(url: url)
            // Initialise the task for getting the data, this is a custom method so you will get a compile error here as we haven't yet written this method.
            initialiseTaskForGettingData(request, element: "results", completionHandler: {
                (response) in
                if let responseArray = response as? Array<Any> {
                    self.moviesArray = responseArray
                    print("response count")
                    print(responseArray.count)
                }
            })
        }
    }
    
    
    func initialiseTaskForGettingData(_ request: URLRequest, element:String, completionHandler: @escaping (Array<Any>) -> ())
    {
        /* 4 - Initialize task for getting data */
        // NOTE: this call is asynchronous
        // - james
        
        
        
        let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
            
            var chArray: [Any] = []
            
            if let error = downloadError
            {
                print("\(String(describing: data)) \n data")
                print("\(String(describing: response)) \n response")
                print("\(error)\n error")
            }
            else
            {
                // Create a variable to hold the results once they have been passed through the JSONSerialiser.
                // Why has this variable been declared with an explicit data type of Any
                let parsedResult: Any!
                do
                {
                    // Convert the http response payload to JSON.
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }
                catch let error as NSError
                {
                    parsedResult = nil
                }
                catch
                {
                    fatalError()
                }
                
                // Log the results to the console, so you can see what is being sent back from the service.
                print(parsedResult)
                
                // Extract an element from the data as an array, if your JSON response returns a dictionary you will need to convert it to an NSDictionary
                // Why must parsedResult be cast to AnyObject if it is already declared as type Any, there is a clue in the syntax :-)
                var moviesDbArray = (parsedResult as AnyObject).value(forKey: element) as? NSArray
                
                var id:String?
                    for m in moviesDbArray!
                    {
                        let movie = m as! NSDictionary
                        
                        chArray.append(movie)
                        
                        if let name = movie.value(forKey: "id") as? Int {
                            print("movies id:")
                            print(name)
                        }
                        
                    }
                
                completionHandler(chArray)
                
                }
            
        })
        // Execute the task
        task.resume()
        
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 5))
        //sema.wait()
    }
    
    func getMovieImage(_ movieId: String)
    {
        // Build the URL as the basis for the request
        let getRandomImage = BASE_URL + MOVIE_DETAILS + movieId + "/images" + API_KEY
        let url = URL(string: getRandomImage)!
        let request = URLRequest(url: url)
        
        // Initialise the task for getting the data
        let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
            if let error = downloadError
            {
                print(error)
            }
            else
            {
                // Parse the data received from the service
                var parsingError: NSError? = nil
                let parsedResult: Any!
                do
                {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }
                catch var error as NSError
                {
                    parsingError = error
                    parsedResult = nil
                }
                catch
                {
                    fatalError()
                }
                
                // Extract an element from the data as an array, if your JSON response returns a dictionary you will need to convert it to an NSDictionary
                if let photosArray = (parsedResult as AnyObject).value(forKey: "backdrops") as? NSArray
                {
                    // Grab a random image from the array
                    let randomPhotoIndex = Int(arc4random_uniform(UInt32(photosArray.count)))
                    
                    // This time, I can convert to an NSDictionary, even though it is illformed the attribute I am after is quoted and so I can access it from the dictionary
                    let imageDictionary = photosArray[randomPhotoIndex] as? NSDictionary
                    
                    // Extract a random image url from the dictionary
                    let imageUrlString = imageDictionary?.value(forKey: "file_path") as? NSString
                    
                    // Build the full url of the image
                    let baseImageUrlString = "https://image.tmdb.org/t/p/original"
                    let fullImageUrlString = baseImageUrlString + (imageUrlString! as String)
                    let imageURL = URL(string: fullImageUrlString)
                    
                    // If the image exists at the url specified set the UIImageView to reference that image
                    if let imageData = try? Data(contentsOf: imageURL!)
                    {
                        DispatchQueue.main.async(execute: {self.image.image = UIImage(data: imageData)})
                    }
                }
            }
        })
        // Execute the task
        task.resume()
    }
    
}
extension String {
    
    func escapedParameters() -> String {
        
        var urlVars = [String]()
        let parameters:[String: AnyObject] = [
            "query": self as AnyObject
        ]
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
        }
        
        return (!urlVars.isEmpty ? "" : "") + urlVars.joined(separator: "&")
    }
}
