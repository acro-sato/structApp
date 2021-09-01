
import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SetOKDelegate {
    @IBOutlet weak var tableView: UITableView!
    var person = Person()
    var personArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let userNameLabel = cell.contentView.viewWithTag(1)as!UILabel
        userNameLabel.text = personArray[indexPath.row].name
        
        let useSyumiLabel = cell.contentView.viewWithTag(2)as!UILabel
        useSyumiLabel.text =
        personArray[indexPath.row].syumi
        
        let useMovieLabel = cell.contentView.viewWithTag(3)as!UILabel
        useMovieLabel.text = personArray[indexPath.row].movie
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    @IBAction func favButtonAction(_ sender: Any) {
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }
    func set(check: Person) {
        personArray.append(check)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.setOKDelegate = self
        }
    }
}

