import UIKit
import PlaygroundSupport
import PDFKit

//View para visualizar  o pdf
class ProfileViewController: UIViewController {
    
    public var pdfdocument: PDFDocument?
    public var name: String?
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = backgroundColor
        
        
        if #available(iOSApplicationExtension 11.0, *){
            
            var pdfview: PDFView!
            pdfview = PDFView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
            pdfview.document = pdfdocument
            pdfview.displayMode = PDFDisplayMode.singlePageContinuous
            pdfview.autoScales = true
            
            self.view = pdfview
        }
        else {
            print("PDFKit is not supported for versions before iOS 11.0")
        }
    }
}
//classe para configurar as celulas de collection view
class MyCollectionViewCell: UICollectionViewCell {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var backgroundBook: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundBook = UIImageView(frame: CGRect(x: 5, y: 0, width: frame.size.width - 10, height: frame.size.height))
        backgroundBook.contentMode = UIViewContentMode.scaleAspectFit
        
        self.addSubview(backgroundBook)
        self.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 135).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//Principal view
class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout, UIDocumentPickerDelegate {
    // CollectionView DataSource
    private let pdfNames: [String] = ["Action Comics 989", "Liga da Justica 31", "Liga da Justica V3 28", "Superman V4 26"]
    private var pdfBooks: [PDFDocument] = []
    
    override func loadView() {
        super.loadView()
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")
        
        for pdfDoc in pdfNames {
            
            let url = Bundle.main.url(forResource: pdfDoc, withExtension: "pdf")
            pdfBooks.append(PDFDocument(url: url!)!)
        }
        
        
    }
    //funcao para add titulo e botao add
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Leitor PDF"
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPdf))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pdfNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCell", for: indexPath) as! MyCollectionViewCell
        
        // UIControlerViewCells does not have viewDidLoad method, so we have to set the value directly into the element (nameLabel in this case). It is not usual.
        cell.nameLabel.text = pdfNames[indexPath.row]
        if let page = pdfBooks[indexPath.row].page(at: 0) {
            let thumb = page.thumbnail(of: cell.bounds.size, for: PDFDisplayBox.cropBox)
            cell.backgroundBook.image = thumb
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        let profileViewController = ProfileViewController()
        profileViewController.pdfdocument = pdfBooks[indexPath.row] as! PDFDocument
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
    @objc func addPdf(sender: UIBarButtonItem){
        let documentPicker : UIDocumentPickerViewController = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: UIDocumentPickerMode.import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(documentPicker, animated: true, completion: nil)
    }
    
    func pickPdf(_ picker: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        pdfBooks.append(PDFDocument(url: url)!)
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
    
}

PlaygroundPage.current.liveView = UINavigationController(rootViewController:CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))


