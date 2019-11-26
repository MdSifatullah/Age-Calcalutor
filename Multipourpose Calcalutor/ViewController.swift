//
//  ViewController.swift
//  Multipourpose Calcalutor
//
//  Created by Md Sifat on 11/25/19.
//  Copyright © 2019 Md Sifat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var day: [String] = []
    var month: [String] = []
    var year: [String] = []
    var yearRecent: [String] = []
    var birth_date = 1, birth_month = 1, birth_year = 1950;
    var present_date = 26, present_month = 11, present_year = 2019;
    @IBOutlet weak var dayRdataPicker: UIPickerView!
    @IBOutlet weak var monthRdataPicker: UIPickerView!
    @IBOutlet weak var yearRdataPicker: UIPickerView!
    @IBOutlet weak var recentDateShowlbl: UILabel!
    @IBOutlet weak var birthDateShowlbl: UILabel!
    @IBOutlet weak var dayDataPicker: UIPickerView!
    @IBOutlet weak var ResultShowLbl: UILabel!
    @IBOutlet weak var monthDataPicker: UIPickerView!
    @IBOutlet weak var yearDataPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dayDataPicker.dataSource = self
        dayDataPicker.delegate = self
        monthDataPicker.dataSource = self
        monthDataPicker.delegate = self
        yearDataPicker.dataSource = self
        yearDataPicker.delegate = self
        dayRdataPicker.dataSource = self
        dayRdataPicker.delegate = self
        monthRdataPicker.dataSource = self
        monthRdataPicker.delegate = self
        yearRdataPicker.dataSource = self
        yearRdataPicker.delegate = self
        for dayAdd in 1...31{
            day.append(String(dayAdd))
        }
        for monthAdd in 1...12{
            month.append(String(monthAdd))
        }
        for yearAdd in 1950...2019{
            year.append(String(yearAdd))
        }
        for yearAd in (1950...2050).reversed(){
            yearRecent.append(String(yearAd))
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dayDataPicker{
            return day.count;
        }
        else if pickerView == monthDataPicker{
            return month.count;
        }
        else if pickerView == yearDataPicker{
            return year.count;
        }
        else if pickerView == dayRdataPicker{
            return day.count;
        }
        else if pickerView == monthRdataPicker{
            return month.count;
        }
        else if pickerView == yearRdataPicker{
            return yearRecent.count;
        }
        else
        {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if  pickerView == dayDataPicker {
             birth_date = Int(day[row])!;
        }
        else if pickerView == monthDataPicker {
           birth_month = Int(month[row])!;
        }
        else if pickerView == yearDataPicker{
               birth_year = Int(year[row])!;
            }
        else if pickerView == dayRdataPicker{
               present_date = Int(day[row])!;
            }
        else if pickerView == monthRdataPicker{
               present_month = Int(month[row])!;
            }
        else if pickerView == yearRdataPicker{
               present_year = Int(yearRecent[row])!;
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if  pickerView == dayDataPicker {
            return day[row];
        }
        else if pickerView == monthDataPicker {
           return month[row];
        }
        else if pickerView == yearDataPicker{
               return year[row];
        }
        else if pickerView == dayRdataPicker{
               return day[row];
        }
        else if pickerView == monthRdataPicker {
           return month[row];
        }
        else if pickerView == yearRdataPicker{
               return yearRecent[row];
        }
        else
        {
            return "1"
        }
        
        
    }
    

    @IBAction func clearAll(_ sender: Any) {
        ResultShowLbl.text = "Result"
        birthDateShowlbl.text = "DD-MM-YY"
    }
    
    @IBAction func AgeCalculate(_ sender: Any) {
        
        let month: [Int] = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
        if (birth_date > present_date) {
           present_date = present_date + month[birth_month - 1];
           present_month = present_month - 1;
        }
        if (birth_month > present_month) {
           present_year = present_year - 1;
           present_month = present_month + 12;
        }
        let final_date = present_date - birth_date
        let final_month = present_month - birth_month
        let final_year = present_year - birth_year
        
        ResultShowLbl.text = "\(final_year) years \(final_month) Months \(final_date) Days  "
        
        
        
    }
    @IBAction func showRecentDatelbl(_ sender: Any) {
        
                recentDateShowlbl.text = "\(present_date)-\(present_month)-\(present_year)"
    }
    @IBAction func setBirthDate(_ sender: Any) {
        
        birthDateShowlbl.text = "\(birth_date)-\(birth_month)-\(birth_year)"
  
    }
}

