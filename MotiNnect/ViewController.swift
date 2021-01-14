//
//  ViewController.swift
//  MotiNnect
//
//  Created by donghun on 2021/01/05.
//

import UIKit
import FSCalendar

class ViewController: UIViewController ,UIGestureRecognizerDelegate,FSCalendarDelegate{

    @IBOutlet weak var calendarContraintHeight: NSLayoutConstraint!
    @IBOutlet weak var calendar: FSCalendar!

    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(self.scopeGesture)
        calendar.scope = .week
        self.calendarContraintHeight.constant = calendar.bounds.height
        self.calendar.headerHeight = 0

    }
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarContraintHeight.constant = bounds.height
        self.view.layoutIfNeeded()
    }
    
}

extension ViewController:  UITableViewDelegate {

}

extension ViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as? HabitCell else { return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50.00)
    }
}

class HabitCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func checkState(_ sender: Any) {
        checkButton.isSelected = !checkButton.isSelected
    }
    
}
