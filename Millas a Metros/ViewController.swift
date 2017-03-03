//
//  ViewController.swift
//  Millas a Metros
//
//  Created by Eduardo D De La Cruz Marr on 15/1/17.
//  Copyright © 2017 Eduardo D De La Cruz Marrero. All rights reserved.
//

import UIKit

class ViewController : UIViewController
{
    @IBOutlet var distanceTextField : UITextField!
    @IBOutlet var convertionSegmentedControlFrom : UISegmentedControl!
    @IBOutlet var convertionSegmentedControlTo: UISegmentedControl!
    @IBOutlet var resultLabel : UILabel!
    
    let kmToMilesUnit : Double = 0.621371
    let kmToYardsUnit : Double = 1093.61
    let milesToYardsUnit : Double = 1760
    let centToInchesUnit    : Double = 0.393701
    let centToKmUnit : Double = 0.00001
    let centToYardsUnit : Double = 0.0109361
    let centToMilesUnit : Double = 0.000006213712
    let inchesToMilesUnit : Double = 0.00001578283
    let inchesToKmUnit : Double = 0.0000254
    let inchesToYardsUnit : Double = 0.0277778
    
    override var prefersStatusBarHidden : Bool // Desaparece la barra de estado del iphone (true) muy usado en juegos con false aparece de nuevo
    {
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = "Escribe la distancia a convertir"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertPressed(_ sender: UIButton)
    {
        if distanceTextField.text == ""
        {
            alert(messageAlert : "Debes ingresar una distancia para hacer la conversion")
        }
        else if convertionSegmentedControlFrom.selectedSegmentIndex == convertionSegmentedControlTo.selectedSegmentIndex
        {
            alert(messageAlert: "No se puede convertir ya que son las mismas unidades")
        }
        else
        {
            //**************************************** MILLAS A: **********************************************************************//
            
            if convertionSegmentedControlFrom.selectedSegmentIndex == 0 && convertionSegmentedControlTo.selectedSegmentIndex == 1
            {
                convertionDiv(fromText: " Millas = " , toText: " Km" , unit : kmToMilesUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 0 && convertionSegmentedControlTo.selectedSegmentIndex == 2
            {
                convertionMult(fromText: " Millas = ", toText: " Yardas", unit: milesToYardsUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 0 && convertionSegmentedControlTo.selectedSegmentIndex == 3
            {
                convertionDiv(fromText: " Millas = ", toText: " Cm", unit: centToMilesUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 0 && convertionSegmentedControlTo.selectedSegmentIndex == 4
            {
                convertionDiv(fromText: " Millas = ", toText: " Pulgadas", unit: inchesToMilesUnit)
            }
                
            //******************************************* KM A: **********************************************************************//
                
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 1 && convertionSegmentedControlTo.selectedSegmentIndex == 0
            {
                convertionMult(fromText: " Km = ", toText: " Millas", unit: kmToMilesUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 1 && convertionSegmentedControlTo.selectedSegmentIndex == 2
            {
                convertionMult(fromText: " Kn = ", toText: " Yardas", unit: kmToYardsUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 1 && convertionSegmentedControlTo.selectedSegmentIndex == 3
            {
                convertionDiv(fromText: " Kn = ", toText: " Cm", unit: centToKmUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 1 && convertionSegmentedControlTo.selectedSegmentIndex == 4
            {
                convertionDiv(fromText: " Kn = ", toText: " Pulgadas", unit: inchesToKmUnit)
            }
                
            //**************************************** Yardas A: **********************************************************************//
                
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 2 && convertionSegmentedControlTo.selectedSegmentIndex == 0
            {
                convertionDiv(fromText: " Yardas = ", toText: " Millas", unit: milesToYardsUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 2 && convertionSegmentedControlTo.selectedSegmentIndex == 1
            {
                convertionDiv(fromText: " Yardas = ", toText: " Km", unit: kmToYardsUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 2 && convertionSegmentedControlTo.selectedSegmentIndex == 3
            {
                convertionDiv(fromText: " Yardas = ", toText: " Cm", unit: centToYardsUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 2 && convertionSegmentedControlTo.selectedSegmentIndex == 4
            {
                convertionDiv(fromText: " Yardas = ", toText: " Pulgadas", unit: inchesToYardsUnit)
            }
            
            //******************************************** CM A: **********************************************************************//
            
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 3 && convertionSegmentedControlTo.selectedSegmentIndex == 0
            {
                convertionMult(fromText: " Cm = ", toText: " Millas", unit: centToMilesUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 3 && convertionSegmentedControlTo.selectedSegmentIndex == 1
            {
                convertionMult(fromText: " Cm = ", toText: " Km", unit: centToKmUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 3 && convertionSegmentedControlTo.selectedSegmentIndex == 2
            {
                convertionMult(fromText: " Cm = ", toText: " Yardas", unit: centToYardsUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 3 && convertionSegmentedControlTo.selectedSegmentIndex == 4
            {
                convertionMult(fromText: " Cm = ", toText: " Pulgadas", unit: centToInchesUnit)
            }
            
            //**************************************** PULGADAS A: ********************************************************************//
            
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 4 && convertionSegmentedControlTo.selectedSegmentIndex == 0
            {
                convertionMult(fromText: " Pulgadas = ", toText: " Millas", unit: inchesToMilesUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 4 && convertionSegmentedControlTo.selectedSegmentIndex == 1
            {
                convertionMult(fromText: " Pulgadas = ", toText: " Km", unit: inchesToKmUnit)
            }
            else if convertionSegmentedControlFrom.selectedSegmentIndex == 4 && convertionSegmentedControlTo.selectedSegmentIndex == 2
            {
                convertionMult(fromText: " Pulgadas = ", toText: " Yardas", unit: inchesToYardsUnit)
            }
            else
            {
                convertionDiv(fromText: " Pulgadas = ", toText: " Cm", unit: centToInchesUnit)
            }            
        }
    }
    
    func alert(messageAlert : String)
    {
        let alert : UIAlertController = UIAlertController(title: "Que pena!!! Revisa!!!", message : messageAlert, preferredStyle: .alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Entendido", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated : true, completion : nil)
    }
    
    func convertionMult(fromText : String , toText : String , unit : Double)
    {
        resultLabel.text = String(format : "%.2f" , Double(distanceTextField.text!)!) + fromText + String(format : "%.2f" , Double(distanceTextField.text!)! * unit) + toText // String(format : "%.2f" , XXX) lo que hace es pasar el DOUBLE XXX a string pero conservando solo 2 decimales...
    }
    
    func convertionDiv(fromText : String , toText : String , unit : Double)
    {
        resultLabel.text = String(format : "%.2f" , Double(distanceTextField.text!)!) + fromText + String(format : "%.2f" , Double(distanceTextField.text!)! / unit) + toText
    }
}
