//
//  ViewController.swift
//  HelloWorld
//
//  Created by 존진 on 3/12/25.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        print("7 ViewController.setupUI()")
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        // frame layout 붙여질 뷰의 위치와 크기 설정
        label.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40)
        // self.view(메인 뷰)에 라벨 추가
        view.addSubview(label)
        
        // 버튼 추가
        let button = UIButton()
        button.setTitle("Go second", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.frame = CGRect(x: 20, y: 200, width: view.frame.width - 40, height: 40)
        button.addTarget(self, action: #selector(goSecond), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func didDismissSecondViewController(message: String){
        print("SecondViewController에서 전달받은 메시지: \(message)")
    }
    
    @objc func goSecond() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        self.present(secondVC, animated: true)
    }

}

