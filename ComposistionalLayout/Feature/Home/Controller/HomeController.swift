//
//  ViewController.swift
//  ComposistionalLayout
//
//  Created by Felipe Angeli on 04/08/24.
//

import UIKit

class HomeController: UIViewController {
    
    var homeView: HomeView?
    
    var anuncio = ["Anúncio"]
    
    var categorias = ["Restaurantes", "Mercados", "Farmácia", "Pet Shop", "Bebidas"]
    
    var restaurantes = ["McDonalds", "Sodie Doces", "Pastelaria","McDonalds", "Sodie Doces", "Pastelaria","McDonalds", "Sodie Doces", "Pastelaria","McDonalds", "Sodie Doces", "Pastelaria"]
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configCompositionLayout()
        homeView?.configCollectionView(delegate: self, dataSource: self)
    }
    
    func configNavigation() {
        title = "Compositonal Layout"
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // define a quantia de sessoes que a tela tera
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //numero de celulas na sessao
        switch section {
        case 0:
            return categorias.count
        case 1:
            return anuncio.count
        case 2:
            return restaurantes.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
            
            //podemos registar celulas diferentes
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell
            cell?.titleLabel.text = categorias[indexPath.row]
            
            return cell ?? UICollectionViewCell()
        
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell
            cell?.titleLabel.text = anuncio[indexPath.row]
            
            return cell ?? UICollectionViewCell()
         
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell
            cell?.titleLabel.text = restaurantes[indexPath.row]
            
            return cell ?? UICollectionViewCell()

        default:
            return UICollectionViewCell()
            
        }
    }
    
    //cabeário(Restaurantes)
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        switch indexPath.section {
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeadler.indentifier, for: indexPath) as? TitleHeadler
            header?.titleCollectionLabel.text = "Restaurantes"
            return header ?? UICollectionReusableView()
        default:
            return UICollectionViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section {
        
        case 0:
            print(categorias[indexPath.row])
        case 1:
            print(anuncio[indexPath.row])
        case 2:
            print(restaurantes[indexPath.row])
        default:
            print("Error")
        }
    }
}

// como passamos o design do composutional para o nossa CollectionView?

extension HomeController {
    func configCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) in
            
            switch sectionNumber {
            case 0:
                Layout.sharedObjc.horizontalLayout()
            case 1:
                Layout.sharedObjc.advertiseLayout()
            case 2:
                Layout.sharedObjc.itemsLayout()
            
            default:
                Layout.sharedObjc.horizontalLayout()
            }
            
        }
        
        homeView?.homeCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
}

#Preview {
    HomeController()
}
