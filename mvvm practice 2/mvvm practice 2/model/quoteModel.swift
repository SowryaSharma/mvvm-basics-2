
import Foundation
struct quotes:Codable{
    var content:String
    var author:String
    private enum quotecodingkeys:String,CodingKey{
        case content = "content"
        case author = "author"
    }
}

extension quotes{
    init(from decoder:Decoder) throws{
        let info = try decoder.container(keyedBy: quotecodingkeys.self)
        try content = info.decodeIfPresent(String.self, forKey: .content) ?? ""
        try author = info.decodeIfPresent(String.self, forKey: .author) ?? ""
    }
}
