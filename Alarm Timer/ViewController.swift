//
//  ViewController.swift
//  Alarm Timer
//
//  Created by D7703_22 on 2018. 4. 18..
//  Copyright © 2018년 D7703_22. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    //데이터피크 이름 지정
    @IBOutlet weak var alarmTime: UILabel!
    //데이터피크에서 지정한 시간이 알람타임(Label2)에 표시 됨,
    //지정한 시간이 되면 빨간색으로 바뀜
    @IBOutlet weak var currentTimeLabel: UILabel!
    //현재시간이 표시(Label)
    
    var myTimer = Timer()
    //Timer 메소드 사용
    
    
    func updateTime() {
        let date = Date()
        //현재 시간을 만들수 있게 하는코드
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        
        currentTimeLabel.text = formatter.string(from: date)
        //현재시간 표시
        
        if currentTimeLabel.text == alarmTime.text {
            view.backgroundColor = UIColor.red
        }
        //지정한 시간이 되면 빨간색으로 변경
    }
    //업데이트 함수 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        alarmTime.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
            self.updateTime()
            //1초마다 변화
       })
    }
    




    @IBAction func DatePicker(_ sender: Any) {
        
        print("change Date Picker")
        print(myDatePicker.date)
        
        // dateFormat
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        alarmTime.text = formatter.string(from: myDatePicker.date)
    }
    //데이터피크에서 시간을 지정하면 AlarmTime(Label2)에 추가 되도록
    
    @IBAction func stopAlert(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
}

