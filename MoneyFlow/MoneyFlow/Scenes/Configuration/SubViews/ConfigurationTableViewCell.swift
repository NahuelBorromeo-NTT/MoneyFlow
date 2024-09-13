//
//  ConfigurationTableViewCell.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 11/09/24.
//

import UIKit

final class ConfigurationTableViewCell: UITableViewCell {
    
    private let configurationLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(configurationLabel)
        
        NSLayoutConstraint.activate([
            configurationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            configurationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            configurationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
    }
    
    func setup(title: String) {
        configurationLabel.text = title
    }
}
