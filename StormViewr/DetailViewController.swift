//
//  DetailViewController.swift
//  StormViewr
//
//  Created by Montserrat Gomez on 24/09/24.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var imageView: UIImageView! //coneccon entre el codigo y el interface Builder
	
	var selectedImage: String? //para guardar el nombre de la imagen
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = selectedImage
		
		if let imageToLoad = selectedImage { //crear la imagen
			imageView.image  = UIImage(named: imageToLoad)
		}
		
		navigationItem.largeTitleDisplayMode = .never
    }
	
	///cuando se va a mostrar
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	///cuando se va a desaparecer
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
