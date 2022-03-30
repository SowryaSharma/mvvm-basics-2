
import Foundation


class parser{
    
    func fetch( comp :@escaping (String)->()){

        let url = URL(string: "https://api.quotable.io/random")
                       var request = URLRequest(url: url!)
                       request.httpMethod = "GET"
                       let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                           if let error = error {
                               print("Error took place \(error)")
                               return
                           }
                           if let response = response as? HTTPURLResponse {
                               print("Response HTTP Status code: \(response.statusCode)")}
                           if let data = data{
                            let q:quotes = try! JSONDecoder().decode(quotes.self, from: data)
                            let con = q.content
                            comp(con)
         
                                
                               }
                       }
                       task.resume()

        }
}
