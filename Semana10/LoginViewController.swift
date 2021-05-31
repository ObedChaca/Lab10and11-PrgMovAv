import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userOrEmailTextField.text="prueba1@gmail.com"
        
    }
    
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickLogin(_ sender: Any) {
        
        let user = userOrEmailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: user, password: password) {(responseUser, error) in
            if error == nil {
                print("Login OK")
                self.performSegue(withIdentifier: "seguehome", sender: nil)
                self.userOrEmailTextField.text! = ""
                self.passwordTextField.text! = ""
            } else {
                let alert = UIAlertController(title: "Error", message: "User or Password incorrect", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                print("Login Error")
            }
        }
        
    }
    
    
}
