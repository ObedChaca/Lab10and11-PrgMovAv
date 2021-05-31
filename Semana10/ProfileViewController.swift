import UIKit
import FirebaseDatabase
import Firebase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var firstnamelabel: UITextField!
    @IBOutlet weak var lastnamelabel: UITextField!
    @IBOutlet weak var usernamelabel: UITextField!
    @IBOutlet weak var emaillabel: UITextField!
    @IBOutlet weak var birthday: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    

}
