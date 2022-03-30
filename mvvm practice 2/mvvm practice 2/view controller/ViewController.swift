

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let parse = parser()
    var author=""
    var quote=""

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
            cell.textLabel!.numberOfLines = 0
            cell.textLabel!.lineBreakMode = .byWordWrapping
            cell.textLabel?.text=quote
            
            return cell
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        parse.fetch{
            data in
            self.quote = data
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
        
    }


}


