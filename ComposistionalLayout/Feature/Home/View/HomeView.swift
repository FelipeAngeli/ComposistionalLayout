//
//  HomeView.swift
//  ComposistionalLayout
//
//  Created by Felipe Angeli on 04/08/24.
//

import UIKit

class HomeView: UIView {
    
    lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        collectionView.register(TitleHeadler.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeadler.indentifier)
        return collectionView
    }()
    
    
    func configCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        homeCollectionView.delegate = delegate
        homeCollectionView.dataSource = dataSource
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
        addSubview(homeCollectionView)
    }
    
    
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            homeCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            homeCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
}

#Preview {
    HomeView()
}
