import UIKit
import PlaygroundSupport


class ProfileViewController: UIViewController {
    
    public var imageDocument: UIImage?
    public var name: String?
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = backgroundColor
        
        var imgView: UIImageView!
        imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
        imgView.contentMode = UIViewContentMode.scaleAspectFit
        imgView.image = imageDocument
        self.view = imgView
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var backgroundBook: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    // layout
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundBook = UIImageView(frame: CGRect(x: 5, y: 0, width: frame.size.width - 10, height: frame.size.height))
        backgroundBook.contentMode = UIViewContentMode.scaleToFill
        
        self.addSubview(backgroundBook)
        self.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: backgroundBook.bottomAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//collection view tela principal
class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    @IBOutlet weak var myImageView: UIImageView!
    private var gallery: [UIImage] = [#imageLiteral(resourceName: "IMG_0029.JPG"), #imageLiteral(resourceName: "IMG_0027.JPG"), #imageLiteral(resourceName: "IMG_0024.JPG"), #imageLiteral(resourceName: "IMG_0026.JPG"), #imageLiteral(resourceName: "IMG_0023.JPG")]

    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
    }
    
    override func viewDidLoad() {
        //Titulo do app
        super.viewDidLoad()
        self.title = "Galeria de Imagens"
        
        //Botao add imagem da biblioteca
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(photofromLibrary))
        self.navigationItem.rightBarButtonItem = rightButton
        
        //Botao tirar foto
        let leftButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(shootPhoto))
        self.navigationItem.leftBarButtonItem = leftButton
    
        picker.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        cell.backgroundBook.image = gallery[indexPath.row]
        
        return cell
    }
    
    //funcao pegar imagem e colocar no array
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let profileViewController = ProfileViewController()
        profileViewController.imageDocument = gallery[indexPath.row] 
        profileViewController.name = profileCell.nameLabel.text
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    @objc func openWithNavigation() {
        let newVC = ProfileViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 150, height: 150)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        myImageView.contentMode = .scaleAspectFit //3
        myImageView.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true, completion: nil)
    }
    
    //Funcao tirar foto
    @IBAction func shootPhoto(_ sender: UIBarButtonItem){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    
    //Funcao puxar foto da biblioteca
    @IBAction func photofromLibrary(_ sender: UIBarButtonItem) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = sender
    }
    
    //Funcao apresentar erro caso nao tenha camera
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present( alertVC, animated: true, completion: nil)
    }
    
    //funcao para atualizar a view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        gallery.append(image!)
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
    
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))


