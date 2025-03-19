//
//  TabBarController.swift
//  TabDemo
//
//  Created by 존진 on 3/19/25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemBackground
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        setupTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setupTabBar() {
        // 뷰 컨트롤러 생성
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        
        // 네비게이션 컨트롤러 생성
        let firstNavController = UINavigationController(rootViewController: firstVC)
        let secondNavController = UINavigationController(rootViewController: secondVC)
        
        // 탭 바 아이템 설정
        self.viewControllers = [firstNavController, secondNavController]
        
        firstNavController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "1.circle"), tag: 0)
        secondNavController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "2.circle"), tag: 1)
    }

}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
