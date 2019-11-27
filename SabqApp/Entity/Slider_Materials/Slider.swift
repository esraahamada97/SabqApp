/* 
 Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
struct Slider: Codable {
    let id: String?
    let title: String?
    let secondaryTitle: String?
    let description: String?
    let publishDate: String?
    let coverPhoto: String?
    let noOfViews: Int?
    //    let publishDateHijryDate : String?
    //    let updateDate : String?
    //    let updateDateHijryDate : String?
    //    let categoryName : String?
    //    let parentCategoryName : String?
    
    //    let coverPhotoCaption : String?
    //    let authorName : String?
    //    let url : String?
    //    let materialType : String?
    //    let authorImg : String?
    //    let authorCity : String?
    //    let multipleAuthors : Bool?
    //    let imagesCount : Int?
    //    let videosCount : Int?
    //    let noOfLikes : Int?
    //    let noOfShares : Int?
    
    //    let noOfComments : Int?
    //    let liked : Bool?
    //    let readLater : Bool?
    //    let materialUpdated : Bool?
    //    let isEdit : Bool?
    //    let hasRelatedMaterials : Bool?
    //    let authors : [String]?
    //    let images : [String]?
    //    let videos : [String]?
    //    let attachements : [String]?
    //    let tags : [Tags]?
    //    let updates : [String]?
    //    let relatedMaterials : [String]?
    //    let matarialDisplayed : String?
    //    let comments : [String]?
    //    let descriptionString : String?
    //    let city : String?
    //    let commentsEnabled : Bool?
    //    let commentsMinCharacters : Int?
    //    let commentsMaxCharacters : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case secondaryTitle
        case description
        case publishDate
        case coverPhoto
        case noOfViews
        //        case publishDateHijryDate = "publishDateHijryDate"
        //        case updateDate = "updateDate"
        //        case updateDateHijryDate = "updateDateHijryDate"
        //        case categoryName = "categoryName"
        //        case parentCategoryName = "parentCategoryName"
        
        //        case coverPhotoCaption = "coverPhotoCaption"
        //        case authorName = "authorName"
        //        case url = "url"
        //        case materialType = "materialType"
        //        case authorImg = "authorImg"
        //        case authorCity = "authorCity"
        //        case multipleAuthors = "multipleAuthors"
        //        case imagesCount = "imagesCount"
        //        case videosCount = "videosCount"
        //        case noOfLikes = "noOfLikes"
        //        case noOfShares = "noOfShares"
        
        //        case noOfComments = "noOfComments"
        //        case liked = "liked"
        //        case readLater = "readLater"
        //        case materialUpdated = "materialUpdated"
        //        case isEdit = "isEdit"
        //        case hasRelatedMaterials = "hasRelatedMaterials"
        //        case authors = "authors"
        //        case images = "images"
        //        case videos = "videos"
        //        case attachements = "attachements"
        //        case tags = "tags"
        //        case updates = "updates"
        //        case relatedMaterials = "relatedMaterials"
        //        case matarialDisplayed = "matarialDisplayed"
        //        case comments = "comments"
        //        case descriptionString = "descriptionString"
        //        case city = "city"
        //        case commentsEnabled = "commentsEnabled"
        //        case commentsMinCharacters = "commentsMinCharacters"
        //        case commentsMaxCharacters = "commentsMaxCharacters"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        secondaryTitle = try values.decodeIfPresent(String.self, forKey: .secondaryTitle)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        publishDate = try values.decodeIfPresent(String.self, forKey: .publishDate)
        coverPhoto = try values.decodeIfPresent(String.self, forKey: .coverPhoto)
        noOfViews = try values.decodeIfPresent(Int.self, forKey: .noOfViews)
        //        publishDateHijryDate = try values.decodeIfPresent(String.self, forKey: .publishDateHijryDate)
        //        updateDate = try values.decodeIfPresent(String.self, forKey: .updateDate)
        //        updateDateHijryDate = try values.decodeIfPresent(String.self, forKey: .updateDateHijryDate)
        //        categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
        //        parentCategoryName = try values.decodeIfPresent(String.self, forKey: .parentCategoryName)
        
        //        coverPhotoCaption = try values.decodeIfPresent(String.self, forKey: .coverPhotoCaption)
        //        authorName = try values.decodeIfPresent(String.self, forKey: .authorName)
        //        url = try values.decodeIfPresent(String.self, forKey: .url)
        //        materialType = try values.decodeIfPresent(String.self, forKey: .materialType)
        //        authorImg = try values.decodeIfPresent(String.self, forKey: .authorImg)
        //        authorCity = try values.decodeIfPresent(String.self, forKey: .authorCity)
        //        multipleAuthors = try values.decodeIfPresent(Bool.self, forKey: .multipleAuthors)
        //        imagesCount = try values.decodeIfPresent(Int.self, forKey: .imagesCount)
        //        videosCount = try values.decodeIfPresent(Int.self, forKey: .videosCount)
        //        noOfLikes = try values.decodeIfPresent(Int.self, forKey: .noOfLikes)
        //        noOfShares = try values.decodeIfPresent(Int.self, forKey: .noOfShares)
        
        //        noOfComments = try values.decodeIfPresent(Int.self, forKey: .noOfComments)
        //        liked = try values.decodeIfPresent(Bool.self, forKey: .liked)
        //        readLater = try values.decodeIfPresent(Bool.self, forKey: .readLater)
        //        materialUpdated = try values.decodeIfPresent(Bool.self, forKey: .materialUpdated)
        //        isEdit = try values.decodeIfPresent(Bool.self, forKey: .isEdit)
        //        hasRelatedMaterials = try values.decodeIfPresent(Bool.self, forKey: .hasRelatedMaterials)
        //        authors = try values.decodeIfPresent([String].self, forKey: .authors)
        //        images = try values.decodeIfPresent([String].self, forKey: .images)
        //        videos = try values.decodeIfPresent([String].self, forKey: .videos)
        //        attachements = try values.decodeIfPresent([String].self, forKey: .attachements)
        //        tags = try values.decodeIfPresent([Tags].self, forKey: .tags)
        //        updates = try values.decodeIfPresent([String].self, forKey: .updates)
        //        relatedMaterials = try values.decodeIfPresent([String].self, forKey: .relatedMaterials)
        //        matarialDisplayed = try values.decodeIfPresent(String.self, forKey: .matarialDisplayed)
        //        comments = try values.decodeIfPresent([String].self, forKey: .comments)
        //        descriptionString = try values.decodeIfPresent(String.self, forKey: .descriptionString)
        //        city = try values.decodeIfPresent(String.self, forKey: .city)
        //        commentsEnabled = try values.decodeIfPresent(Bool.self, forKey: .commentsEnabled)
        //        commentsMinCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMinCharacters)
        //        commentsMaxCharacters = try values.decodeIfPresent(Int.self, forKey: .commentsMaxCharacters)
    }
    
}
