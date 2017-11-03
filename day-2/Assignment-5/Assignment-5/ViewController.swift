//
//  ViewController.swift
//  Assignment-5
//
//  Created by DXC-Technology on 11/3/17.
//  Copyright © 2017 lukasnguyen. All rights reserved.
//

import UIKit

struct jsonStruct: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: address
    var phone: String
    var website: String
    var company: company
}

struct address:Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: geo
}

struct company:Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}

struct geo:Codable {
    var lat: String
    var lng: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTable: UITableView!
    
    let list = ["Mot", "Hai", "Ba"]
    
    var myArray = [jsonStruct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getJsonDat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(myArray.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let item = myArray[indexPath.row]
        cell?.textLabel?.text = item.username
        return cell!
    }

    func getJsonDat() {
//        let url = "https://jsonplaceholder.typicode.com/users/"
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONDecoder().decode([jsonStruct].self, from: data!)
                    
                    self.myArray = json
                    OperationQueue.main.addOperation({
                        self.myTable.reloadData()
                    })
                    
                }catch let error as NSError{
                    print(error)
                }
            }
        }).resume()
    }

}

