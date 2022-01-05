/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation

struct Item : Codable {
	let title : String?
	let link : String?
	let media : Media?
	let dateTaken : String?
	let description : String?
	let published : String?
	let author : String?
	let authorId : String?
	let tags : String?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case link = "link"
		case media = "media"
		case dateTaken = "date_taken"
		case description = "description"
		case published = "published"
		case author = "author"
		case authorId = "author_id"
		case tags = "tags"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		media = try values.decodeIfPresent(Media.self, forKey: .media)
		dateTaken = try values.decodeIfPresent(String.self, forKey: .dateTaken)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		published = try values.decodeIfPresent(String.self, forKey: .published)
		author = try values.decodeIfPresent(String.self, forKey: .author)
		authorId = try values.decodeIfPresent(String.self, forKey: .authorId)
		tags = try values.decodeIfPresent(String.self, forKey: .tags)
	}

}
