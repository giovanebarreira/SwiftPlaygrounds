import UIKit
import PlaygroundSupport


// Classe principal
class FirstViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        //Criacao dos botoes
        
        let button1 = UIButton(type: .custom)
        button1.setBackgroundImage(#imageLiteral(resourceName: "IMG_0023.JPG"), for: .normal)
        button1.setTitle("PLANES", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.contentVerticalAlignment = .bottom
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 3
        button1.layer.borderColor = UIColor.white.cgColor
        button1.tintColor = #colorLiteral(red: 0.952941179275513, green: 0.686274528503418, blue: 0.133333340287209, alpha: 1.0)
        button1.titleLabel?.font = UIFont(name: "Helvetica neue", size: 25)
        button1.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button1.tag = 1
        view.addSubview(button1)
        
        
        let button2 = UIButton(type: .custom)
        button2.setBackgroundImage(#imageLiteral(resourceName: "IMG_0027.JPG"), for: .normal)
        button2.setTitle("PLACES", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.contentVerticalAlignment = .bottom
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor.white.cgColor
        button2.tintColor = #colorLiteral(red: 0.952941179275513, green: 0.686274528503418, blue: 0.133333340287209, alpha: 1.0)
        button2.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button2.tag = 2
        view.addSubview(button2)
        
        let button3 = UIButton(type: .custom)
        button3.setBackgroundImage(#imageLiteral(resourceName: "FERRARY.jpg"), for: .normal)
        button3.setTitle("CARS", for: .normal)
        button3.setTitleColor(UIColor.white, for: .normal)
        button3.contentVerticalAlignment = .bottom
        button3.layer.cornerRadius = 5
        button3.layer.borderWidth = 3
        button3.layer.borderColor = UIColor.white.cgColor
        button3.tintColor = #colorLiteral(red: 0.952941179275513, green: 0.686274528503418, blue: 0.133333340287209, alpha: 1.0)
        button3.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button3.tag = 3
        view.addSubview(button3)
        
        let button4 = UIButton(type: .custom)
        button4.setBackgroundImage(#imageLiteral(resourceName: "Dodge.jpg"), for: .normal)
        button4.setTitle("MOTORCYCLES", for: .normal)
        button4.setTitleColor(UIColor.white, for: .normal)
        button4.contentVerticalAlignment = .bottom
        button4.layer.cornerRadius = 5
        button4.layer.borderWidth = 3
        button4.layer.borderColor = UIColor.white.cgColor
        button4.tintColor = #colorLiteral(red: 0.952941179275513, green: 0.686274528503418, blue: 0.133333340287209, alpha: 1.0)
        button4.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button4.tag = 4
        view.addSubview(button4)
        
        let button5 = UIButton(type: .custom)
        button5.setBackgroundImage(#imageLiteral(resourceName: "greubel-1024x782.jpg"), for: .normal)
        button5.setTitle("WATCHES", for: .normal)
        button5.setTitleColor(UIColor.white, for: .normal)
        button5.contentVerticalAlignment = .bottom
        button5.layer.cornerRadius = 5
        button5.layer.borderWidth = 3
        button5.layer.borderColor = UIColor.white.cgColor
        button5.tintColor = #colorLiteral(red: 0.952941179275513, green: 0.686274528503418, blue: 0.133333340287209, alpha: 1.0)
        button5.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button5.tag = 5
        view.addSubview(button5)
        
        // Layout botoes
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        button5.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button1.widthAnchor.constraint(equalToConstant: 630),
            button1.heightAnchor.constraint(equalToConstant: 350),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button2.widthAnchor.constraint(equalToConstant: 150),
            button2.heightAnchor.constraint(equalToConstant: 150),
            
            button3.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 10),
            button3.widthAnchor.constraint(equalToConstant: 150),
            button3.heightAnchor.constraint(equalToConstant: 150),
            
            button4.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button4.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: 10),
            button4.widthAnchor.constraint(equalToConstant: 150),
            button4.heightAnchor.constraint(equalToConstant: 150),
            
            button5.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button5.leadingAnchor.constraint(equalTo: button4.trailingAnchor, constant: 10),
            button5.widthAnchor.constraint(equalToConstant: 150),
            button5.heightAnchor.constraint(equalToConstant: 150),
            
            ])
    }

// Segunda classe
class SecondViewController: UIViewController {
    
    public var labelText: String?
    public var changeOption = ""
    public var scrollView = UIScrollView()
    
    override func loadView() {
        super.loadView()
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: 2300, height: 520)
        scrollView.isPagingEnabled = true
        scrollView.flashScrollIndicators()
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        self.view.addSubview(scrollView)
        
        self.view.backgroundColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
      
        //Funcao Master, cria Image e o texo nas telas
        func setImage(_ img: UIImage, _ cons: Int, _ txt: String, _ margs: Int){
            
            let label = UILabel()
            label.text = labelText
            label.textColor = #colorLiteral(red: 0.952941179275513, green: 0.686274528503418, blue: 0.133333340287209, alpha: 1.0)
            label.font = UIFont(name: "Helvetica neue", size: 17)
            label.numberOfLines = 0
            
            label.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(label)
           
            let image = img
            let imageView = UIImageView(image: image)
            scrollView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            // Layout imagens e textos
            
            NSLayoutConstraint.activate([
                self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                
                //Config Margens texto
                label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 450),
                label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(margs)),
                

                //Tamanho da imagem
                imageView.widthAnchor.constraint(equalToConstant: 700),
                imageView.heightAnchor.constraint(equalToConstant: 400),
                imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(cons)),
                
             ])
            label.text = txt
            label.numberOfLines = 0
        }
        
        //Uso do switch para quando rolar a pagina trocar textos e imagens
        switch changeOption {
            case String("PLANES"):
                setImage(#imageLiteral(resourceName: "IMG_0023.JPG"), 0, "FALCON 8X \n\n\n\nManufacturer: Dassault (FRA). \n\n\nEndurance: 11.945 Kms. \n\n\n Max. Speed: 1102. Km/h. \n\n\nPrice: 58 Million USD.", 20)
                setImage(#imageLiteral(resourceName: "IMG_0025.JPG"), 765, "GULFSTREAM 6 \n\n\n\nManufacturer: Gulfstream (USA). \n\n\nEndurance: 12.964 Kms. \n\n\n Max. Speed: 1142. Km/h \n\n\nPrice: 65 Million USD.", 780)
                setImage(#imageLiteral(resourceName: "IMG_0026.JPG"), 1530, "GLOBAL EXPRESS 6000 \n\n\n\nManufacturer: Bombardier (CAN). \n\n\nEndurance: 11.112 Kms. \n\n\n Max. Speed: 1098 Km/h. \n\n\nPrice: 56 Million USD.", 1550)
            
            case String("PLACES"):
                setImage(#imageLiteral(resourceName: "IMG_0024.JPG"), 0, "Seychelles \n\n\nThe Seychelles is an archipelago of 115 islands in the Indian Ocean, off East Africa.\nIt's home to numerous beaches, coral reefs and nature reserves, as well as rare animals \nsuch as giant Aldabra tortoises.\n\n\nOfficial languages: English, French and Seychellois Creole. \n\n\nPopulation: 94.228 (2016)." , 20)
                setImage(#imageLiteral(resourceName: "IMG_0027.JPG"), 765, "Fiji\n\n\nFiji, a country in the South Pacific, is an archipelago of more than 300 islands.\n\n\nIt's famed for rugged landscapes, palm-lined beaches and coral reefs with clear lagoons.\n\n\nOfficial languages: English, Itaukei (Fijian) and Hindi (Fiji Hindi)\n\n\nPopulation: 898.760 (2016)." , 780)
                setImage(#imageLiteral(resourceName: "IMG_0029.JPG"), 1530, "The Maldives\n\n\nThe Maldives is a tropical nation in the Indian Ocean composed of 26 ring-shaped atolls, \nwhich are made up of more than 1,000 coral islands. It’s known for its beaches, blue \nlagoons and extensive reefs.\n\n\nOfficial language: Maldivian (Dhivehi)\n\n\nPopulation: 427.756 (2016)." , 1550)
            
          case String("CARS"):
                setImage(#imageLiteral(resourceName: "FERRARY.jpg"), 0, "Ferrari California T\n\n\nEngine: 552 hp \n\n\n0 km/h - 100 km/h: 3.3 sec \n\n\nPrice: 210.00 USD.", 20)
                setImage(#imageLiteral(resourceName: "ASTON-MARTIN.jpg"), 765, "Aston Martin DB11 T\n\n\nEngine: 600 hp \n\n\n0 km/h - 100 km/h: 3.6 sec \n\n\nPrice: 201.00 USD.", 780)
                setImage(#imageLiteral(resourceName: "BENTLEY.jpg"), 1530, "Bentley Continental GT Speed \n\n\nEngine: 592 hp \n\n\n0 km/h - 100 km/h: 3.4 sec \n\n\nPrice: 213.00 USD.", 1550)

         case String("MOTORCYCLES"):
                setImage(#imageLiteral(resourceName: "Dodge.jpg"), 0, "Dodge Tomahawk \n\n\nEngine: 500 hp \n\n\nTop speed: 680 Km/h \n\n\nPrice: 555.000 USD.", 20)
                setImage(#imageLiteral(resourceName: "Ecosse.jpg"), 765, "Ecosse Titanium \n\n\nEngine: 200 hp \n\n\nTop speed: 321 Km/h \n\n\nPrice: 273.000 USD.", 780)
                setImage(#imageLiteral(resourceName: "Ducatti.jpg"), 1530, "Ducatti NCR M16 \n\n\nEngine: 200 hp \n\n\nTop speed: 330 Km/h \n\n\nPrice: 232.000 USD.", 1550)
            
        default:
                setImage(#imageLiteral(resourceName: "greubel-1024x782.jpg"), 0, "Greubel Forsey Invention Piece 2 Quadruple Tourbillon\n\n\nGreubel Forsey specialize in inventing timepieces with multiple tourbillons and inclined \nbalance wheels with the aim of improving timekeeping precision.\n\n\nMade in: Switzerland \n\n\nPrice: 750.000 USD.", 20)
                setImage(#imageLiteral(resourceName: "rust-1021x1024.jpg"), 765, "Romain Jerome Titanic DNA Tourbillon \n\n\nThere have been only 9 Romain Jerome Titanic DNA Tourbillons ever made. \n\n\nMade in: Switzerland \n\n\nPrice: 319.000 USD.", 780)
                setImage(#imageLiteral(resourceName: "Dubuis.jpg"), 1530, "Roger Dubuis Millesime Double Flying Tourbillon \n\n\nThere have been only 88 Millesime Double Flying Tourbillon watches created and each \none is a work of art.\n\n\nMade in: Switzerland \n\n\nPrice: 263.000 USD.", 1550)
        }
        
    }
}

    
    @objc func openWithNavigation(sender: UIButton) {
        let newVC = SecondViewController()
        
        //Uso do switch para identificar qual botao foi apertado e carregar as img e text da proxima tela
        switch sender.tag {
            case 1:
                newVC.changeOption = "PLANES"
                self.navigationController?.pushViewController(newVC, animated: true);
            
            case 2:
                newVC.changeOption = "PLACES"
                self.navigationController?.pushViewController(newVC, animated: true);
            
            case 3:
                newVC.changeOption = "CARS"
                self.navigationController?.pushViewController(newVC, animated: true);
            
            case 4:
                newVC.changeOption = "MOTORCYCLES"
                self.navigationController?.pushViewController(newVC, animated: true);
            
            default:
                newVC.changeOption = "WATCHES"
                self.navigationController?.pushViewController(newVC, animated: true);
            
        }
    }
}

let firstViewController = FirstViewController()
PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)


