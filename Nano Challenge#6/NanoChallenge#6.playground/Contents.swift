//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class StopWatchViewController: UIViewController, UITableViewDelegate {
    
    var timerLabel = UILabel()
    var tableView = UITableView()
    var totalSec:Float = 0
    var timer = Timer()
    var lapTimeArray = [String]()
    var startButton = UIButton()
    var pauseButton = UIButton()
    var reset = UILabel()
    
    
    
            // MARK: - buttons tapped
        func startButtonTapped(_ sender: UIButton) {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
            self.startButton.isEnabled = false
        }
        
        func stopButtonTapped(_ sender: UIButton) {
            timer.invalidate()
             self.startButton.isEnabled = true
            
        }
        
        func resetButtonTapped(_ sender: UIButton) {
            lapTimeArray.append(timerLabel.text!)
            timer.invalidate()
            totalSec = 0
            timerLabel.text = "00:00:00"
            pauseButton.isEnabled = false
            startButton.isEnabled = true
            tableView.reloadData()
            
        }
        
        // MARK: - table view methods
        private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lapRecordCell")
            cell?.textLabel?.text = lapTimeArray[indexPath.row]
            return cell!
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return lapTimeArray.count
        }
        
        // MARK: - update timer
        func updateTimer() {
            totalSec += 1
    
          
            
            let hourStr = Int(totalSec) / 3600
            let minStr = Int(totalSec) / 60 % 60
            let secStr = Int(totalSec) % 60
            
            
            timerLabel.text = "\(hourStr):\(minStr):\(secStr)"
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "StopWatch"
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        timerLabel.text = "Tap Start."
        
        let button1 = startButton
        button1.setTitle("Start", for: .normal)
        button1.contentVerticalAlignment = .bottom
        button1.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button1.titleLabel?.font = UIFont(name: "helvetica", size: 18)
        button1.layer.cornerRadius =  5
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.black.cgColor
        
        button1.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.addSubview(button1)
        
        let button2 = UIButton()
        button2.setTitle("Stop", for: .normal)
        button2.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button2.contentVerticalAlignment = .bottom
        button2.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button2.layer.cornerRadius =  5
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.black.cgColor
        
        
        button2.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        
        view.addSubview(button2)
        
        let button3 = UIButton()
        button3.setTitle("Reset", for: .normal)
        button3.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button3.contentVerticalAlignment = .bottom
        button3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button3.layer.cornerRadius =  5
        button3.layer.borderWidth = 2
        button3.layer.borderColor = UIColor.black.cgColor
        
        
        button3.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        view.addSubview(button3)
        
        let label = timerLabel
        label.textAlignment = .center
        label.font = UIFont(name: "helvetica", size: 40)
        
        
        view.addSubview(label)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            button1.widthAnchor.constraint(equalToConstant: 100),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button2.leadingAnchor.constraint(equalTo: button1.leadingAnchor, constant: 120),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button3.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 120),
            button3.widthAnchor.constraint(equalToConstant: 100),
            button3.heightAnchor.constraint(equalToConstant: 40),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 150),
            
            
            
            ])
    }
 }


class TimerViewController: UIViewController{
    
    var startButton = UIButton()
    var pauseButton = UIButton()
    var timerLabel =  UILabel()
    var reset = UILabel()
    var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer: Timer?
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    var resumeTapped = false
    //var isTimerRunning = false
    
    @IBAction func startButtonTapped(_ sender: UIButton){
        if isTimerRunning == false{
            runTimer()
            self.startButton.isEnabled = false
        }
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    
    @IBAction func pauseButtonTapped(_ sender: UIButton){
        if self.resumeTapped == false{
            timer?.invalidate()
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume", for: .normal)
        }else{
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.pauseButton.setTitle("Pause",for: .normal)
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton){
        timer?.invalidate()
        seconds = 60
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
    }
    
    func timeString(time: TimeInterval) -> String{
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i: %02i: %02i", hours, minutes, seconds)
    }
    
    
    func updateTimer() {
        if seconds < 1{
            timer?.invalidate()
            //send alert
        }else{
            seconds -= 1     //This will decrement(count down)the seconds.
            timerLabel.text = timeString(time: TimeInterval(seconds)) //This will update the label.
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)  // background color do form view
        self.title = "Timer"
        
        pauseButton.isEnabled = false
        
        
        let buttonStart = UIButton(type: .custom)
        buttonStart.setTitle("Start", for: .normal)
        buttonStart.setTitleColor(UIColor.black, for: .normal)
        buttonStart.contentVerticalAlignment = .bottom
        buttonStart.layer.cornerRadius = 5
        buttonStart.layer.borderWidth = 3
        buttonStart.layer.borderColor = UIColor.black.cgColor
        buttonStart.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        buttonStart.tag = 1
        view.addSubview(buttonStart)
        
        
        let buttonPause = UIButton(type: .custom)
        buttonPause.setTitle("Pause", for: .normal)
        buttonPause.setTitleColor(UIColor.black, for: .normal)
        buttonPause.contentVerticalAlignment = .bottom
        buttonPause.layer.cornerRadius = 5
        buttonPause.layer.borderWidth = 3
        buttonPause.layer.borderColor = UIColor.black.cgColor
        buttonPause.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        buttonPause.tag = 2
        view.addSubview(buttonPause)
        
        let buttonReset = UIButton(type: .custom)
        buttonReset.setTitle("Reset", for: .normal)
        buttonReset.setTitleColor(UIColor.black, for: .normal)
        buttonReset.contentVerticalAlignment = .bottom
        buttonReset.layer.cornerRadius = 5
        buttonReset.layer.borderWidth = 3
        buttonReset.layer.borderColor = UIColor.black.cgColor
        buttonReset.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        buttonReset.tag = 2
        view.addSubview(buttonReset)
        
        
        view.addSubview(timerLabel)
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont(name: "Helvetica neue", size: 60)
        
        
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonPause.translatesAutoresizingMaskIntoConstraints = false
        buttonReset.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStart.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            buttonStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStart.widthAnchor.constraint(equalToConstant: 100),
            buttonStart.heightAnchor.constraint(equalToConstant: 35),
            
            buttonPause.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            buttonPause.leadingAnchor.constraint(equalTo: buttonStart.trailingAnchor, constant: 10),
            buttonPause.widthAnchor.constraint(equalToConstant: 100),
            buttonPause.heightAnchor.constraint(equalToConstant: 35),
            
            buttonReset.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            buttonReset.leadingAnchor.constraint(equalTo: buttonPause.trailingAnchor, constant: 10),
            buttonReset.widthAnchor.constraint(equalToConstant: 100),
            buttonReset.heightAnchor.constraint(equalToConstant: 35),
            
            timerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 ),
            timerLabel.widthAnchor.constraint(equalToConstant: 300),
            timerLabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            ])
        
    }
    
    
}


class MyTabBarController: UITabBarController{
    
    //will apper para icones
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        let stopWatchViewController = UINavigationController(rootViewController: StopWatchViewController())
        // The following statement is what you need
        let tabBarItem1:UITabBarItem = UITabBarItem(title: "Stop watch", image: #imageLiteral(resourceName: "clock-stopwatch-7.png").withRenderingMode(UIImageRenderingMode.alwaysTemplate), selectedImage: UIImage(named: "Stop watch"))
        stopWatchViewController.tabBarItem = tabBarItem1
        
        
        //My second view controller
        let timerViewController = UINavigationController(rootViewController: TimerViewController())
        // The following statement is what you need
        let tabBarItem2:UITabBarItem = UITabBarItem(title: "Timer", image: #imageLiteral(resourceName: "clock-timer-7.png").withRenderingMode(UIImageRenderingMode.alwaysTemplate), selectedImage: UIImage(named: "timer"))
        timerViewController.tabBarItem = tabBarItem2
        
        // Setup my two ViewController into my TabBarController
        self.viewControllers = [stopWatchViewController, timerViewController]
    }
    
}


PlaygroundPage.current.liveView = MyTabBarController()
