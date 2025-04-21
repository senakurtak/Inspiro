//
//  Coordinator.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

extension Coordinator {

    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func containsChild(_ coordinator: Coordinator) -> Bool {
        return  childCoordinators.contains(where: { $0 === coordinator })
    }

    func checkIfChildFinish(_ fromViewController: UIViewController) {
        childCoordinators.forEach { (coordinator) in
            if coordinator.childCoordinators.isEmpty {
                if coordinator.rootViewController == fromViewController {
                    if childDidFinish(coordinator) {
                        return
                    }
                }
            } else {
                coordinator.checkIfChildFinish(fromViewController)
            }
        }
    }

    func popBack(animated: Bool = true) {
        self.navigationController.popViewController(animated: animated)
    }

    private func childDidFinish(_ child: Coordinator?) -> Bool {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
                childCoordinators.remove(at: index)
                return true
        }
        return false
    }
}
