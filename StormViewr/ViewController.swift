//
//  ViewController.swift
//  StormViewr
//
//  Created by Montserrat Gomez on 22/09/24.
//

import UIKit

class ViewController: UITableViewController { //Crear una nueva vista
	
	var pictures = [String]()

	override func viewDidLoad() {
		super.viewDidLoad() //metodo del UIViewController
		title = "Storm Viewer"
		
		let fm = FileManager.default //para trabajar con el filesystem, para buscar archivos
		let path = Bundle.main.resourcePath! //Direccion de los archivos de la app
		let items = try! fm.contentsOfDirectory(atPath: path)
		
		for item in items {
			if item.hasPrefix("nssl") {
				pictures.append(item)
			}
		}
		
		print(pictures)
		
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	///Para indicar cuantas rows tendra
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count //retorna el numero de rows que necesito
	}
	
	///Para retornar lo que va a tener la celda
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) //creamos el objeto de la celda
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}
	
	
	///Para seleccionar una celda
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController { //para abrir una nueva vista de tipo detail
			vc.selectedImage = pictures[indexPath.row]
			navigationController?.pushViewController(vc, animated: true) //para navegar a la nueva vista
		}
	}


}

