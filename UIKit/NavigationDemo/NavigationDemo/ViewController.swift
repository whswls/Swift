//
//  ViewController.swift
//  NavigationDemo
//
//  Created by 존진 on 3/19/25.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        self.title = "네비게이션 타이틀"
        
        let appearance = UINavigationBarAppearance()
        
        // 배경색 설정
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // 그림자 제거하고 싶은 경우
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        // 네비게이션 바의 큰 타이틀 설정
        //    self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = .systemBlue
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let VC = UIViewController()
        VC.view.backgroundColor = .systemYellow
        VC.title = "서브 타이틀"
        //self.navigationController?.pushViewController(VC, animated: true)
    }
}
#Preview {
    UINavigationController(rootViewController: ViewController())
}

