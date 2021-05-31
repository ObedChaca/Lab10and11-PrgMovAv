import UIKit
import FirebaseAuth
import Firebase

class ImagenViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadPhotoButton: UIBarButtonItem!
    @IBOutlet weak var camerabtn: UIButton!
    
    
    var imagePicker = UIImagePickerController()
    var url:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor.black.cgColor
        //imageView.layer.cornerRadius = imageView.bounds.width / 2
        uploadPhotoButton.isEnabled = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        url = info[UIImagePickerController.InfoKey.imageURL] as? URL
        print(url!)
        
        imageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTap(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
        uploadPhotoButton.isEnabled = true
    }
    
    
    
    
    @IBAction func upload(_ sender: Any) {
        if url != nil {
            uploadIMG(fileURL: url!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    func uploadIMG (fileURL : URL) {
        guard let userID = (Auth.auth().currentUser?.uid) else { return }
        let imagenesFolder = Storage.storage().reference().child("imagenes").child(userID)
        let localFile = fileURL
        //let imagenData = UIImage.pngData(imageView.image!)
    
        imagenesFolder.child("\(NSUUID().uuidString).png").putFile(from: localFile, metadata: nil) { (metadata, error) in
            if error != nil {
                print("Ocurrió un error:\(String(describing: error))")
            } else {
                self.performSegue(withIdentifier: "seleccionarContactoSegue", sender: nil)
                
            }
        }
    }
}
