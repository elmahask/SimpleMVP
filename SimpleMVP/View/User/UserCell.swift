//
//  UserCell.swift
//  SimpleMVP
//
//  Created by Wael M Elmahask on 7/20/19.
//  Copyright © 2019 Wael M Elmahask. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell, UserCellDelegate {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var uesrEmailLabel: UILabel!
    @IBOutlet weak var userAddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func diplayUserName(username: String) {
        userNameLabel.text = username
    }
    
    func diplayUserEmail(email: String) {
        uesrEmailLabel.text = email
    }
    
    func diplayUserAddress(address: String) {
        userAddressLabel.text = address
    }
    

}
