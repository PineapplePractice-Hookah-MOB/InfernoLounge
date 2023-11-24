//
//  CustomTabBarController.swift
//  InfernoLounge
//
//  Created by Владимир Данилович on 16.11.23.
//

import SwiftUI


class CustomTabBarController: UITabBarController {

  private lazy var middleItem: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "tabBarMidItem")
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  private lazy var tableImageView: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "table")
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  private lazy var tabBack: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "tabBarBackground")
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  init(childControllers: [UIViewController]) {
    super.init(nibName: nil, bundle: nil)
    viewControllers = childControllers
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    makeUI()
    setTabBarAppearance()
  }

  private func makeUI() {

    tabBar.addSubview(tabBack)
    tabBar.addSubview(middleItem)
    middleItem.addSubview(tableImageView)

    NSLayoutConstraint.activate([
      tabBack.topAnchor.constraint(equalTo: tabBar.topAnchor),
      tabBack.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: -40),
      tabBack.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 10),
      tabBack.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: -10)
      ])

    NSLayoutConstraint.activate([
      middleItem.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
      middleItem.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -11)
      ])

    NSLayoutConstraint.activate([
      tableImageView.centerXAnchor.constraint(equalTo: middleItem.centerXAnchor),
      tableImageView.centerYAnchor.constraint(equalTo: middleItem.centerYAnchor)
      ])
  }

  private func setTabBarAppearance() {
    let positionOnX: CGFloat = 10
    let positionOnY: CGFloat = 14
    let width = tabBar.bounds.width - positionOnX * 2
    let height = 40.0

    let roundLayer = CAShapeLayer()

    let bezierPath = UIBezierPath(
      roundedRect: CGRect(
        x: positionOnX,
        y: tabBar.bounds.minY - positionOnY,
        width: width,
        height: height
      ),
      cornerRadius: 5
    )

    roundLayer.path = bezierPath.cgPath

    tabBar.layer.insertSublayer(roundLayer, at: 0)
    tabBar.tintColor = .white
    tabBar.unselectedItemTintColor = .white

    roundLayer.fillColor = UIColor.clear.cgColor
  }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item)
        if selectedIndex == 2 {
          middleItem.image = UIImage(named: "tabBarMidItemw")
          tableImageView.image = UIImage(named: "tapTable")
        } else {
          middleItem.image = UIImage(named: "tabBarMidItem")
          tableImageView.image = UIImage(named: "table")
        }
    }
}
