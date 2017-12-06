// Equipe Bruna, Giovane, Pedro


import UIKit
import PlaygroundSupport


class TextFieldViewController : UIViewController, UITextFieldDelegate {
    
    var textField : UITextField!
    var textField2 : UITextField!
    var button : UIButton!
    var label4 = UILabel()
    var label5 = UILabel()
    var calculo = Double()
    
    var conversorAlcool = Double()
    var conversorGasolina = Double()
    
    
    override func loadView() {
        // Array nomes
        var titulos = ["Preço", "Gasolina", "Álcool", "Relação Eta./Gas.: "]
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.803921580314636, green: 0.803921580314636, blue: 0.803921580314636, alpha: 1.0)
        
        //Titulo preços
        var label = UILabel()
        label.text = titulos[0]
        view.addSubview(label)
        label.font = UIFont(name: "Helvetica", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ])
        
        //Titulo Gasolina
        let label1 = UILabel()
        label1.text = titulos[1]
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])
        
        //Campo preenchimento valor Gasolina
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.text = ""
        
        //Titulo Alcool
        let label2 = UILabel()
        label2.text = titulos[2]
        view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])
        
        //Campo preenchimento valor Alcool
        textField2 = UITextField()
        textField2.borderStyle = .roundedRect
        textField2.text = ""
        
        
        //Button na tela
        button = UIButton(type: .system)
        button.setTitle("  Calcular  ", for: .normal)
        
        
        //tamanho e nome de fonte do Botão 
        button.titleLabel!.font = UIFont(name: "Helvetica", size: 25)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.tintColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button.backgroundColor = #colorLiteral(red: 0.600000023841858, green: 0.600000023841858, blue: 0.600000023841858, alpha: 1.0)
        
        button.addTarget(self, action: #selector(updateLabel), for: .touchUpInside)
        
        //alinhamento do texto dentro do botao
        button.titleLabel?.baselineAdjustment = UIBaselineAdjustment.alignCenters
        
        
        //Titulo Relacao Eta/Gas
        let label3 = UILabel()
        label3.text = titulos[3]
        view.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label3.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            label3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])
        
            //Exibe valor porcentagem relacao Alcool/Gasolina
        label4.text = " "
        view.addSubview(label4)
        label4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label4.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            label4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170),
            ])
        
        // Informacao de qual combustivel usar
        label5.text = "            "
        label5.font = UIFont.systemFont(ofSize: 50)
        //label5.layer.borderColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        label5.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label5.adjustsFontForContentSizeCategory = true
        
        //ajustar tamanho da letra dentro da borda
        label5.adjustsFontSizeToFitWidth = true
        
        label5.layer.cornerRadius = 5
        label5.layer.masksToBounds = true
        label5.layer.borderWidth = 1
        view.addSubview(label5)
        
        
        //Definição do tamanho e posição da label
        let margins4 = view.layoutMarginsGuide
        label5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label5.topAnchor.constraint(equalTo: margins4.topAnchor, constant: 350),
            label5.leadingAnchor.constraint(equalTo: margins4.leadingAnchor, constant: 30),
            label5.trailingAnchor.constraint(equalTo: margins4.trailingAnchor, constant: -35),
            label5.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            ])
        
        view.addSubview(textField)
        view.addSubview(textField2)
        view.addSubview(button)
        
        label = UILabel()
        view.addSubview(label)
        
        self.view = view
        
        // Layout 
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        
        textField2.translatesAutoresizingMaskIntoConstraints = false
        let margins2 = view.layoutMarginsGuide
        
        button.translatesAutoresizingMaskIntoConstraints = false
        let margins3 = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 85),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -35),
            
            textField2.topAnchor.constraint(equalTo: margins2.topAnchor, constant: 155),
            textField2.leadingAnchor.constraint(equalTo: margins2.leadingAnchor, constant: 30),
            textField2.trailingAnchor.constraint(equalTo: margins2.trailingAnchor, constant: -35),
            
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            ])
        
        
        self.view = view
    }
    
    
    //Função do ao apertar o botão 
    @objc func updateLabel(sender: UIButton) {
        
        var alcool = String()
        var gasolina = String()
        
            //receber o que o usuari digitou
        alcool = textField2.text!
        gasolina = textField.text!
        
            //conversor de String para Double
        conversorAlcool = (alcool as NSString).doubleValue
        conversorGasolina =  (gasolina as NSString).doubleValue
        
        //Checar info dentro dos textfields e fazer calculo
        if conversorAlcool == nil || conversorGasolina == nil || conversorAlcool == 0 || conversorGasolina == 0 || conversorAlcool < 0 || conversorGasolina < 0{
            label5.text = " Preencha as informações corretamente. "
        } else {
            calculo = (conversorAlcool / conversorGasolina) * 100
            
                //label recebendo resultado da conta convertido
            label4.text = String(format: "%.2f", calculo) + "%"
            
            if calculo < 70 {
                label5.text = " Abasteça com Alcool! "
            } else{
                label5.text = " Abasteça com Gasolina! "
            }
        }
    }
}
PlaygroundPage.current.liveView = TextFieldViewController()

