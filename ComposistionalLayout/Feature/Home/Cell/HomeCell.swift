//
//  HomeCell.swift
//  ComposistionalLayout
//
//  Created by Felipe Angeli on 04/08/24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Titulo"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView() {
        self.backgroundColor = .secondarySystemBackground
        layer.masksToBounds = true
        layer.cornerRadius = 12
        
        addSubview(titleLabel)
    }
    
   func  setUpConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
