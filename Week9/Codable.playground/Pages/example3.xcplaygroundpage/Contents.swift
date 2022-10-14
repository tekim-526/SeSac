//: [Previous](@previous)

import Foundation

let json = """
{
"quote_content": "Count your age by friends, not years. Count your life by smiles, not tears.",
"author_name": null,
"likeCount": 12345
}
"""

struct Quote: Decodable {
    let ment: String
    let author: String
    let like: Int
    let isInfluencer: Bool
    
    enum CodingKeys: String, CodingKey {
        case ment = "quote_content"
        case author = "author_name"
        case like = "likeCount"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ment = try container.decode(String.self, forKey: .ment)
        author = try container.decodeIfPresent(String.self, forKey: .author) ?? "unknown"
        like = try container.decode(Int.self, forKey: .like)
        isInfluencer = (10000...).contains(like) ? true : false
    }
}

//String -> Data -> Quote

guard let result = json.data(using: .utf8) else { fatalError("Error")}

print(result)


//Data -> Quote
do {
    let value = try JSONDecoder().decode(Quote.self, from: result)
    print(value)
    print(value.ment)
    print(value.author)
    print(value.like)
} catch {
    print(error)
}

//: [Next](@next)
