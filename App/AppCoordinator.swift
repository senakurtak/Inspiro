//
//  AppCoordinator.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import UIKit

final class AppCoordinator: NSObject, Coordinator {

    var window: UIWindow
    var rootViewController: UIViewController?

    var childCoordinators: [Coordinator] = []

    var navigationController = UINavigationController()


    init(_ window: UIWindow? = nil ) {
        self.window = window ?? UIWindow(frame: UIScreen.main.bounds)
        self.window.rootViewController = navigationController
        super.init()
    }

    func start() {
        startApp()
    }

    func startApp() {
    let viewController = QuoteViewController()
        navigationController.setViewControllers([viewController], animated: true)
    }

}
