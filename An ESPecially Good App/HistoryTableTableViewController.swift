//
//  HistoryTableTableViewController.swift
//  An ESPecially Good App
//
//  Created by student on 2/28/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit


class HistoryTableTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    /// it clears the data in the history

    @IBAction func clear(Sender:Any){
        Predictions.shared.clearResults()
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    /// returns the number of sections
    /// - Parameter tableView: <#tableView description#>
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Predictions.shared.numAttempted()
    }
    let optimalRowHeight:CGFloat = 130
    override func tableView(_ tableView: UITableView,  heightForRowAt indexPath: IndexPath) -> CGFloat{
        return optimalRowHeight
    }
    
    /// This function access the data from the table and assign images to the table actual and predicted values
    /// - Parameters:
    ///   - tableView: assigning images of the actual and predicted values
    ///   - indexPath: this indexpath gives you the values of each question generated
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "espCell", for: indexPath)
        
        
        if let question = Predictions.shared.question(at: indexPath.row){
            let resultLBL = cell.viewWithTag(100) as! UILabel
            let actualIV = cell.viewWithTag(300) as! UIImageView
            let predictedIV = cell.viewWithTag(400) as! UIImageView
            if let actuaImage = UIImage(named:"\(question.actualShape!).png") {
                actualIV.image = actuaImage
            }
            
            if let predictedImage = UIImage(named:"\(question.predictedShape!).png") {
                predictedIV.image = predictedImage
            }
            if question.isCorrect == true {
                resultLBL.text = "😀"
            }
            else {
                resultLBL.text = "😡"
            }
        }
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

