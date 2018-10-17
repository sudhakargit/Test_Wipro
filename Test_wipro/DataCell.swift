//
//  DataCell.swift
//  Test_wipro
//
//  Created by Amit on 16/10/18.
//  Copyright © 2018 Asti Infotech. All rights reserved.
//

import UIKit
import Kingfisher
class DataCell: UITableViewCell {

    @IBOutlet weak var imgHeight: NSLayoutConstraint!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fillData(obj: Row){
        lblTitle.text = obj.title
        lblDescription.text = obj.description
        if let data = obj.imageHref {
                if let url = URL(string: data){
                    self.imgView.kf.setImage(with: url)
                }
        }
        else
        {
            self.imgView.image = UIImage(named: "")
        }
       
        
    }

}
