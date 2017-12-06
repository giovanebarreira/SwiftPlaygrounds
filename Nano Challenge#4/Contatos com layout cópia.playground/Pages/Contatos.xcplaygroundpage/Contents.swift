// Giovane, Gustavo, Peter
import UIKit
import PlaygroundSupport

//arrays dos dados dos contatos
var contacts = ["Amélia", "Camila", "Bruno", "Cássio", "Beto", "Drauzio", "Tiago", "Yudi", "Xuxa", "Æ", "Rolando", "Oscar", "Kuka", "Valentim"]
var contactsFonetico = ["Melinha", "Ca", "Brunato", "Legero", "Betao", "Dradra", "Thi", "Playstation", "Rainha", "Æ", "Rola", "Braulio", "Pentelho", "Terrinha"]
var contactsSobrenome = ["Silva", "da Costa", "Neto", "Soares", "Filho", "Varella", "Muniz", "Takashiro", "Meneghel", "Æ", "Dealegrida", "Alho", "Beludo", "Terra"]
var contactsTelefone = ["2331-4533", "9775-9900", "4432-8877", "8765-8844", "94453-6643", "92231-6690", "4432-6788", "4002-8922", "6666-6666", "Æ", "0000-0000", "0357-8237", "9562-8593", "9365-8465"]
//P.S.:Qualquer semelhança com pessoas e telefones reais é completamente não intencional.
//array criado com base no array contacts
var sections : [(index: Int, length: Int, title: String)] = Array()

//view de visualizar contato
class ViewContact: UIViewController {
    
     var fieldNome: UILabel!
     var fieldNomeFonetico: UILabel!
     var fieldSobrenome: UILabel!
     var fieldTelefone: UILabel!
    
    public var name: String?
    public var fonName: String?
    public var surName: String?
    public var phone: String?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        fieldNome = UILabel()
        fieldNome.layer.cornerRadius = 5
        fieldNome.text = name
        fieldNome.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        fieldNomeFonetico = UILabel()
        fieldNomeFonetico.layer.cornerRadius = 5
        fieldNomeFonetico.text = fonName
        fieldNomeFonetico.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        fieldSobrenome = UILabel()
        fieldSobrenome.layer.cornerRadius = 5
        fieldSobrenome.text = surName
        fieldSobrenome.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        fieldTelefone = UILabel()
        fieldTelefone.layer.cornerRadius = 5
        fieldTelefone.text = phone
        fieldTelefone.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(fieldNome)
        view.addSubview(fieldNomeFonetico)
        view.addSubview(fieldSobrenome)
        view.addSubview(fieldTelefone)
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "IMG_0045.PNG"))
        view.addSubview(imageView)
        
        self.view = view
        //labels
        let labelName = UILabel()
        labelName.text = "Name:"
        labelName.textAlignment = NSTextAlignment.right
        labelName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelName)
        let labelNameFon = UILabel()
        labelNameFon.text = "Fonetical Name:"
        labelNameFon.textAlignment = NSTextAlignment.right
        labelNameFon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelNameFon)
        let labelSurName = UILabel()
        labelSurName.text = "Surname:"
        labelSurName.textAlignment = NSTextAlignment.right
        labelSurName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelSurName)
        let labelPhone = UILabel()
        labelPhone.text = "Telephone:"
        labelPhone.textAlignment = NSTextAlignment.right
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelPhone)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        fieldNome.translatesAutoresizingMaskIntoConstraints = false
        fieldNomeFonetico.translatesAutoresizingMaskIntoConstraints = false
        fieldSobrenome.translatesAutoresizingMaskIntoConstraints = false
        fieldTelefone.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        
        // Layout
        NSLayoutConstraint.activate([
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            fieldNome.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110),
            fieldNome.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fieldNome.widthAnchor.constraint(equalToConstant: 200),
            fieldNome.heightAnchor.constraint(equalToConstant: 20),
            
            labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            labelName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelName.widthAnchor.constraint(equalToConstant: 200),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            
            fieldNomeFonetico.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110),
            fieldNomeFonetico.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            fieldNomeFonetico.widthAnchor.constraint(equalToConstant: 200),
            fieldNomeFonetico.heightAnchor.constraint(equalToConstant: 20),
            
            labelNameFon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            labelNameFon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            labelNameFon.widthAnchor.constraint(equalToConstant: 200),
            labelNameFon.heightAnchor.constraint(equalToConstant: 20),
            
            fieldSobrenome.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110),
            fieldSobrenome.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            fieldSobrenome.widthAnchor.constraint(equalToConstant: 200),
            fieldSobrenome.heightAnchor.constraint(equalToConstant: 20),
            
            labelSurName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            labelSurName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            labelSurName.widthAnchor.constraint(equalToConstant: 200),
            labelSurName.heightAnchor.constraint(equalToConstant: 20),
            
            fieldTelefone.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110),
            fieldTelefone.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            fieldTelefone.widthAnchor.constraint(equalToConstant: 200),
            fieldTelefone.heightAnchor.constraint(equalToConstant: 20),
            
            labelPhone.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -110),
            labelPhone.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            labelPhone.widthAnchor.constraint(equalToConstant: 200),
            labelPhone.heightAnchor.constraint(equalToConstant: 20)
            
            ])
    }
}
//view de adicionar contato
class addContact: UIViewController, UITextFieldDelegate {
    //struct de contato
    public struct addContato {
        var Nome = String()
        var NomeFonetico = String()
        var Sobrenome = String()
        var Numero = String()
    }
    //declaração de textfields
    public var textFieldNome: UITextField!
    public var textFieldNomeFonetico: UITextField!
    public var textFieldSobrenome: UITextField!
    public var textFieldTelefone: UITextField!
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //botão navigation bar
        let doneButton = UIBarButtonItem()
        let fontStyle = UIFont(name: "Helvetica", size: 20)
        let att = [NSAttributedStringKey.font: fontStyle]
        doneButton.title = "Done"
        doneButton.setTitleTextAttributes(att, for: UIControlState.normal)
        doneButton.setTitleTextAttributes(att, for: UIControlState.highlighted)
        doneButton.style = UIBarButtonItemStyle.plain
        doneButton.target = self
        doneButton.action = #selector(Armazenar)
        doneButton.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItem = doneButton
        //placeholders dos textfields
        let placeholder = NSAttributedString(string:  "First Name ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        let placeholder2 = NSAttributedString(string:  "First Fonetic Name ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        let placeholder3 = NSAttributedString(string:  "Last Name ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        let placeholder4 = NSAttributedString(string:  " Phone ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
            //definições dos textfields
        textFieldNome = UITextField()
        textFieldNome.becomeFirstResponder()
        textFieldNome.borderStyle = .roundedRect
        textFieldNome.text = ""
        textFieldNome.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textFieldNome.attributedPlaceholder = placeholder
        
        textFieldNomeFonetico = UITextField()
        textFieldNomeFonetico.borderStyle = .roundedRect
        textFieldNomeFonetico.text = ""
        textFieldNomeFonetico.attributedPlaceholder = placeholder2
        
        textFieldSobrenome = UITextField()
        textFieldSobrenome.borderStyle = .roundedRect
        textFieldSobrenome.text = ""
        textFieldSobrenome.attributedPlaceholder = placeholder3
        
        textFieldTelefone = UITextField()
        textFieldTelefone.borderStyle = .roundedRect
        textFieldTelefone.text = ""
        textFieldTelefone.attributedPlaceholder = placeholder4
        
        view.addSubview(textFieldNome)
        view.addSubview(textFieldNomeFonetico)
        view.addSubview(textFieldSobrenome)
        view.addSubview(textFieldTelefone)
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "IMG_0045.PNG"))
        view.addSubview(imageView)
        
        self.view = view
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textFieldNome.translatesAutoresizingMaskIntoConstraints = false
        textFieldNomeFonetico.translatesAutoresizingMaskIntoConstraints = false
        textFieldSobrenome.translatesAutoresizingMaskIntoConstraints = false
        textFieldTelefone.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        
        // Layout
        NSLayoutConstraint.activate([
        
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            textFieldNome.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            textFieldNome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            textFieldNome.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            textFieldNomeFonetico.topAnchor.constraint(equalTo: textFieldNome.bottomAnchor, constant: 30),
            textFieldNomeFonetico.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 60),
            textFieldNomeFonetico.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -60),
            
            textFieldSobrenome.topAnchor.constraint(equalTo: textFieldNomeFonetico.bottomAnchor, constant: 30),
            textFieldSobrenome.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 60),
            textFieldSobrenome.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -60),
            
            textFieldTelefone.topAnchor.constraint(equalTo: textFieldSobrenome.bottomAnchor, constant: 30),
            textFieldTelefone.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 60),
            textFieldTelefone.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -60),
        
        ])
    }
    //função de adicionar contatos
     @IBAction func Armazenar (sender: UIButton) {
        
        var Contato = addContato()
        Contato.Nome = textFieldNome.text!
        Contato.NomeFonetico = textFieldNomeFonetico.text!
        Contato.Sobrenome = textFieldSobrenome.text!
        Contato.Numero = textFieldTelefone.text!
        
        //if caso o textfield do nome esteja em branco
        if Contato.Nome == "" {
            let alertController = UIAlertController(title: "Ops! Dados Inválidos!", message:"Preencha os dados corretamente.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil) 
        } else {
            contacts.append(Contato.Nome)
            contactsFonetico.append(Contato.NomeFonetico)
            contactsSobrenome.append(Contato.Sobrenome)
            contactsTelefone.append(Contato.Numero)
            
            Contato.Nome = ""
            Contato.NomeFonetico = ""
            Contato.Sobrenome = ""
            Contato.Numero = ""
            
            let alertController = UIAlertController(title: "Pronto! O contato foi adicionado!", message:"Toque em voltar.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil) 
            TableViewController().tableReload()
                //foi necessário utilizar um comando Notification para poder dar reload na lista de contatos a partir de outra view
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
    }
}
//view da lista de contatos
 class TableViewController : UITableViewController {
    //função para dar reload na lista de contatos a partir de outra view
    @objc func loadList(notification: NSNotification){
        self.tableView.reloadData()
        self.tableView.reloadSectionIndexTitles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //definição da Notification
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        self.title = "Contatos"
        //botão + da navigation bar
        let plusBtn = UIBarButtonItem()
        let fontStyle = UIFont(name: "Helvetica", size: 30)
        let att = [NSAttributedStringKey.font: fontStyle]
        plusBtn.title = "+"
        plusBtn.setTitleTextAttributes(att, for: UIControlState.normal)
        plusBtn.setTitleTextAttributes(att, for: UIControlState.highlighted)
        plusBtn.style = UIBarButtonItemStyle.plain
        plusBtn.target = self
        plusBtn.action = #selector(openWithNavigation)
        plusBtn.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItem = plusBtn
        loadArray()
    }
    //função para dar load nos contatos
     func loadArray(){
        //junta a array "contacts" com a array "contactsFonetico" e organiza em ordem alfabética com base no primeiro array.
        let sortedContacts = zip(contacts, contactsFonetico).sorted {$0.0 < $1.0}
        //separa o array "contactsFonetico" e o salva na ordem do array "contacts"
        contactsFonetico = sortedContacts.map {$0.1}
        //junta a array "contacts" com a array "contactsSobrenome" e organiza em ordem alfabética com base no primeiro array.
        let sortedContacts2 = zip(contacts, contactsSobrenome).sorted {$0.0 < $1.0}
        //separa o array "contactsSobrenome" e o salva na ordem do array "contacts"
        contactsSobrenome = sortedContacts2.map {$0.1}
        //junta a array "contacts" com a array "contactsTelefone" e organiza em ordem alfabética com base no primeiro array.
        let sortedContacts3 = zip(contacts, contactsTelefone).sorted {$0.0 < $1.0}
        //separa o array "contacts" e o salva em ordem alfabética
        contacts = sortedContacts3.map {$0.0}
        //separa o array "contactsTelefone" e o salva na ordem do array "contacts"
        contactsTelefone = sortedContacts3.map {$0.1}
        //um for que pega os dados da array "contacts" mantém somente a primeira letra das Strings e salva na array "sections"
        var index = 0
        for i in 0 ..< contacts.count{
            let commonPrefix = contacts[i].commonPrefix(with: contacts[index], options: .caseInsensitive)
            if (commonPrefix.characters.count == 0) {
                let string = contacts[index].uppercased()
                let firstCharacter = string[string.startIndex]
                let title = "\(firstCharacter)"
                let newSection = (index: index, length: i - index, title: title)
                sections.append(newSection)
                index = i
            }
        }
    }
    //função para limpar a array sections e dar reload na lista de contatos
     func tableReload(){
        sections.removeAll()
        loadArray()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].length
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = contacts[sections[indexPath.section].index + indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // definição de nome, nome fonético, sobrenome e telefone que é informado à view de visualizar contato
        guard let text = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        let detail = ViewContact()
        //localiza na array "contacts" o elemento igual ao text localizado na cell e indica qual o index desse elemento.
        let idx = contacts.index(of: text)
        detail.name = text
        detail.fonName = contactsFonetico[idx!]
        detail.surName = contactsSobrenome[idx!]
        detail.phone = contactsTelefone[idx!]
        navigationController?.pushViewController(detail, animated: true)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map { $0.title }
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //remove o elemento do array "contacts".
            contacts.remove(at: sections[indexPath.section].index + indexPath.row)
            //remove o elemento do array "contactsFonetico".
            contactsFonetico.remove(at: sections[indexPath.section].index + indexPath.row)
            //remove o elemento do array "contactsSobrenome".
            contactsSobrenome.remove(at: sections[indexPath.section].index + indexPath.row)
            //remove o elemento do array "contactsTelefone".
            contactsTelefone.remove(at: sections[indexPath.section].index + indexPath.row)
            //da reload na lista de contatos
            tableReload()
            self.tableView.reloadData()
            self.tableView.reloadSectionIndexTitles()
        }
    }
    //função para adicionar contato
    @IBAction func openWithNavigation(sender: UIButton) {
        let newVCaddContact = addContact()
        self.navigationController?.pushViewController(newVCaddContact, animated: true)
    }
    
}

let tableViewController = TableViewController(style: .plain)

PlaygroundPage.current.liveView = UINavigationController(rootViewController: tableViewController)

