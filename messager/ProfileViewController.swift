//
//  ProfileViewController.swift
//  messager
//
//  Created by Антон on 27.02.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let photoGallery = PhotoGallery()
    let identifire = "PhotoCollectionViewCell"
    let countCells = 3
    let offset: CGFloat = 2.0
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImage.layer.borderWidth = 3.0
        avatarImage.layer.borderColor = UIColor.lightGray.cgColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        imagePicker.delegate = self
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        
        //изменение аватара профиля
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_:)))
            avatarImage.addGestureRecognizer(tapGesture)
            avatarImage.isUserInteractionEnabled = true
    }
    @objc func tapOnImage(_ sender:UITapGestureRecognizer){
        let alert = UIAlertController(title: "Изображение", message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "Из фотогалереи", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "C камеры", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
        // сохранение имени пользователя из настроек
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = UserDefaults.standard.string(forKey: "nameKey") {
            nameLabel.text = name
        }
   }
}

extension ProfileViewController: UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width / CGFloat(countCells)
        let heightCell = widthCell
        let spacing = CGFloat((countCells + 1)) * offset / CGFloat(countCells)
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))
    }
    
    //открытие картинки в фуллскрин
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallery = photoGallery
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension ProfileViewController{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            avatarImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}




