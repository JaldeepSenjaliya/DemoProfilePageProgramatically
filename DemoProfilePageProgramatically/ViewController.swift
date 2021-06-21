//
//  ViewController.swift
//  DemoProfilePageProgramatically
//
//  Created by Jaldeep Patel on 2021-06-21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Top View elements
    let profileImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jaldeep")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    let editButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "edit")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleEditTap), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.text = "Jaldeep Patel"
        return label
    }()
    
    let emailLabel: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "Arial", size: 18)
        label.text = "jaldeep@gmail.com"
        return label
    }()
    
 
    
    //MARK: - Properties of top view elements
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .primaryColor
        
        view.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(top: view.topAnchor, paddingTop: 90, width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2
        
        view.addSubview(editButton)
        editButton.anchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 270, paddingRight: 20, width: 20, height: 20)
        
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 10)
        
        view.addSubview(emailLabel)
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.anchor(top:nameLabel.bottomAnchor, paddingTop: 5)
        
        return view
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set containerView above tableview
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 300)
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Selector
    
    @objc func handleEditTap() {
        performSegue(withIdentifier: "ProfileToUpdateProfile", sender: self)
    }


}

//MARK: - Extension for UI Color


extension UIColor {

    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    static let primaryColor = rgb(red: 62, green: 178, blue: 174)

}


//MARK: - Extension for UIView

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
                
    }
}

