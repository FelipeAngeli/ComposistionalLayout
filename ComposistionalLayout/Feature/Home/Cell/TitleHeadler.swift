//
//  TitleHeadler.swift
//  ComposistionalLayout
//
//  Created by Felipe Angeli on 04/08/24.
//

import UIKit

class TitleHeadler: UICollectionReusableView {
        
    static let indentifier = "TitleHeader"
    
    lazy var titleCollectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Titulo"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.titleCollectionLabel)
        
        NSLayoutConstraint.activate([
            self.titleCollectionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            self.titleCollectionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

}
