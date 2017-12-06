import UIKit
import PlaygroundSupport

// Variaveis globais
var resultado = String()
var numeros = Double()
var conversor = Double()
var visorResultado: String = "0"
let visor = UILabel()
var operacao = ""
var op = "%"


class ViewController : UIViewController {
    //Array de nome de botoes
    var btnNames = [" C ","+-"," %","  / "," 7 "," 8 "," 9 "," X "," 4 "," 5 "," 6 ","  - ","  1 "," 2 "," 3 "," + ","0                     ","  .  ","  = "]
    
    // Array dos botoes
    var drawBtn = [UIButton]()
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .black
        
        //Display dos numeros
        visor.text = ("\(visorResultado)")
        visor.font = UIFont(name: "arial", size: 70)
        visor.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(visor)
        visor.translatesAutoresizingMaskIntoConstraints = false
        
        //Criar botao
        for i in 0 ... btnNames.count - 1{
            drawBtn.append(UIButton (type: .system))
            drawBtn[i].setTitle(btnNames[i], for: .normal)
            drawBtn[i].titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            drawBtn[i].contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
            drawBtn[i].clipsToBounds = true
            drawBtn[i].layer.cornerRadius = 30 
            drawBtn[i].tintColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            drawBtn[i].backgroundColor = #colorLiteral(red: 0.952941179275513, green: 0.686274528503418, blue: 0.133333340287209, alpha: 1.0)
                
            drawBtn[i].addTarget(self, action: #selector(ButtunPressed), for: .touchUpInside)
            drawBtn[i].tag = i
            view.addSubview(drawBtn[i])
        }
        //Exibicao e posicionamento botoes
        for i in 0 ... btnNames.count-1 {
            drawBtn[i].translatesAutoresizingMaskIntoConstraints = false
        }
        var NSlayoutArray = [NSLayoutConstraint]()
        NSlayoutArray.append(visor.topAnchor.constraint(equalTo: view.topAnchor, constant: 0))
        
        
        NSlayoutArray.append(visor.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10))
        for i in 0 ... btnNames.count - 1{
            
            if i <= 3 {
                var Temp:CGFloat = CGFloat((102*i) + 20)
                NSlayoutArray.append(drawBtn[i].topAnchor.constraint(equalTo:visor.bottomAnchor, constant: 20))
                NSlayoutArray.append(drawBtn[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: Temp))
            }else if i > 3 && i <= 7{
                var Temp:CGFloat = CGFloat((102*(i-4)) + 20)
                NSlayoutArray.append(drawBtn[i].topAnchor.constraint(equalTo:drawBtn[3].bottomAnchor, constant: 20))
                NSlayoutArray.append(drawBtn[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: Temp))
            }else if i > 7 && i <= 11{
                var Temp:CGFloat = CGFloat((102*(i-8)) + 20)
                NSlayoutArray.append(drawBtn[i].topAnchor.constraint(equalTo:drawBtn[7].bottomAnchor, constant: 20))
                NSlayoutArray.append(drawBtn[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: Temp))
            }else if i > 11 && i <= 15{
                var Temp:CGFloat = CGFloat((102*(i-12)) + 20)
                NSlayoutArray.append(drawBtn[i].topAnchor.constraint(equalTo:drawBtn[11].bottomAnchor, constant: 20))
                NSlayoutArray.append(drawBtn[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: Temp))
                
            }else if i > 15 && i <= 16{
                var Temp:CGFloat = CGFloat((102*(i-16)) + 20)
                NSlayoutArray.append(drawBtn[i].topAnchor.constraint(equalTo:drawBtn[15].bottomAnchor, constant: 20))
                NSlayoutArray.append(drawBtn[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: Temp))
                
            }else if i > 16 && i <= 17{
                NSlayoutArray.append(drawBtn[i].topAnchor.constraint(equalTo:drawBtn[15].bottomAnchor, constant: 20))
                NSlayoutArray.append(drawBtn[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: 225))
                
            }else if i > 17 && i <= 18{
                NSlayoutArray.append(drawBtn[i].topAnchor.constraint(equalTo:drawBtn[15].bottomAnchor, constant: 20))
                NSlayoutArray.append(drawBtn[i].leftAnchor.constraint(equalTo: view.leftAnchor, constant: 325))
                
                }
        NSLayoutConstraint.activate(NSlayoutArray)
 
    self.view = view
    }
        
        
}
    // Funcoes dos botoes
    @objc func ButtunPressed(sender:UIButton){
        
        var porc = Double()
        func num(operacao: String, numero: String ) {
            if(resultado == operacao || resultado == "0"){
                resultado = numero 
                visor.text = resultado
            }else{
                resultado = resultado + numero
                visor.text = resultado
            }
        }
        /*Funcao para conversao do 1º numero para Double e exibicao na tela
         */
        func oper(operacao: String){
            
            conversor = (resultado as NSString).doubleValue
            numeros = conversor
            resultado = operacao
            visor.text = resultado
        }
        
        // Funcionalides dos botoes
        switch sender.tag {
        case 0:
            //limpar
            numeros = 0
            resultado = "0"
            visor.text = ("\(resultado)")
            
        case 1:
            let plus = "+"
            let minus = "-"
            var temp = String()
            temp = resultado
            var convert = (resultado as NSString).doubleValue
            
            if convert == 0 {
                resultado = minus
                visor.text = resultado
            } else if convert > 0 {
                resultado = minus + temp
                convert = (resultado as NSString).doubleValue
                visor.text = resultado
            } else if convert < 0 {
                convert = convert * (-1)
                resultado = ("\(convert)")
                visor.text = resultado
            }
                 
        case 2:
            var convert = (resultado as NSString).doubleValue
            visor.text = "%"
            var porc = (numeros / 100) * convert
            
            resultado = ("\(porc)")
            
        case 3:
            operacao = "/"
            oper(operacao: operacao)
        case 4:
            num(operacao: operacao, numero: "7")
        case 5:
            num(operacao: operacao, numero: "8")
        case 6:
            num(operacao: operacao, numero: "9")
        case 7:
            operacao = "X"
            oper(operacao: operacao)
        case 8:
            num(operacao: operacao, numero: "4")
        case 9:
            num(operacao: operacao, numero: "5")
        case 10:
            num(operacao: operacao, numero: "6")
        case 11:
            operacao = "-"
            oper(operacao: operacao)
        case 12:
            num(operacao: operacao, numero: "1")
        case 13:
            num(operacao: operacao, numero: "2")
        case 14:
            num(operacao: operacao, numero: "3")
        case 15:
            operacao = "+"
            op = operacao
            conversor = (resultado as NSString).doubleValue
            numeros = conversor
            resultado = "+"
            visor.text = resultado
        case 16:
            num(operacao: operacao, numero: "0")
        case 17:
            let dot = "."
                if resultado.range(of: ".") == nil{
                    resultado = resultado + dot
                }
            
        case 18:
            if operacao == "+"{
                conversor = (resultado as NSString).doubleValue
                numeros = numeros + conversor
                resultado = ("\(numeros)")
                visor.text = resultado
            } else if operacao == "-" {
                conversor = (resultado as NSString).doubleValue
                numeros = numeros - conversor
                resultado = ("\(numeros)")
                visor.text = resultado
            } else if operacao == "X" {
                if op == "%"{
                    visor.text = resultado
                    
                } else {
                    conversor = (resultado as NSString).doubleValue
                    
                    numeros = numeros * conversor
                    resultado = ("\(numeros)")
                    visor.text = resultado
                }
            } else if operacao == "/" {
                conversor = (resultado as NSString).doubleValue
                numeros = numeros / conversor
                resultado = ("\(numeros)")
                visor.text = resultado
            } else if operacao == "%" {
                
                
            }
default:
            <#code#> 
        }
    }
    
    
}
PlaygroundPage.current.liveView = ViewController()


