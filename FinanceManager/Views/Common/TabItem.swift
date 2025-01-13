//
//  TabItem.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//
import UIKit
import Foundation


import UIKit

protocol TabbarViewDelegate {
    func TabItemSelect(tab: TabItem)
}


class TabItem: UIView {
    // MARK: - UI Elements
    let iconImageView = UIImageView()
    let titleLabel = UILabel()

    var isSelected: Bool = false {
        didSet {
            updateAppearance()
        }
    }
    
    var selectedColor: UIColor = #colorLiteral(red: 0.4980392157, green: 0.2392156863, blue: 1, alpha: 1)
    var unselectedColor: UIColor = .gray
    var delegate: TabbarViewDelegate?
    private static var TabItems: [TabItem] = []

    // References for constraints
    private var iconTopConstraint: NSLayoutConstraint!
    private var iconWidthConstraint: NSLayoutConstraint!
    private var iconHeightConstraint: NSLayoutConstraint!

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        TabItem.TabItems.append(self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        TabItem.TabItems.append(self)
    }

    // MARK: - Setup View
    private func setupView() {
        // Configure the image view
        iconImageView.contentMode = .scaleAspectFit
        addSubview(iconImageView)

        // Configure the label
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)

        // Configure Auto Layout
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Create constraints
        iconTopConstraint = iconImageView.topAnchor.constraint(equalTo: topAnchor ) // Default top position
        iconWidthConstraint = iconImageView.widthAnchor.constraint(equalToConstant: 30)
        iconHeightConstraint = iconImageView.heightAnchor.constraint(equalToConstant: 30)

        NSLayoutConstraint.activate([
            iconTopConstraint,
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconWidthConstraint,
            iconHeightConstraint,

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        // Add gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
    private func updateAppearance() {
        let currentColor = isSelected ? selectedColor : unselectedColor
        iconImageView.tintColor = currentColor
        titleLabel.textColor = currentColor
    }

    // MARK: - Public Method
    func configure(with image: UIImage?, title: String) {
        iconImageView.image = image?.withRenderingMode(.alwaysTemplate)
        titleLabel.text = title
        update() // Call update to adjust the layout dynamically
    }
    
    func update() {
        if titleLabel.text == TabItemEnum.ADD_TRANSACTION.rawValue {
            // Adjust size for the Add Transaction tab
            iconWidthConstraint.constant = 50
            iconHeightConstraint.constant = 50
            titleLabel.isHidden = true
            // Adjust position to move it slightly higher
            iconTopConstraint.constant = -18 // Raise by 10 points
        } else {
            // Reset to default size and position for other tabs
            iconWidthConstraint.constant = 30
            iconHeightConstraint.constant = 30
            iconTopConstraint.constant = 0 // Default top position
        }

        layoutIfNeeded() // Update the layout
    }

    @objc private func handleTap() {
        TabItem.TabItems.forEach { $0.deselect() }
        isSelected = true
        self.delegate?.TabItemSelect(tab: self)
    }
    
    func deselect() {
        isSelected = false
    }
}
