import UIKit

let json = """
{
"quote_content": "Count your age by friends, not years. Count your life by smiles, not tears.",
"author_name": "John Lennon"
}
"""

struct Quote: Decodable {
    let quoteContent: String
    let authorName: String
}

//String -> Data -> Quote

guard let result = json.data(using: .utf8) else { fatalError("Error")}

print(result)

let decoder = JSONDecoder()
// camelcase strategy
decoder.keyDecodingStrategy = .convertFromSnakeCase

//Data -> Quote
do {
    let value = try decoder.decode(Quote.self, from: result)
    print(value)
    print(value.quoteContent)
    print(value.authorName)
} catch {
    print(error)
}
