//
//  ItemListTVC.swift
//  TO-DO-APP
//
//  Created by Rahul on 29/05/23.
//

import UIKit

protocol ItemListCellProtocol {
    func updateItemStatus(item: TaskModel)
    func removeItemFromList(item: TaskModel)
}

class ItemListTVC: UITableViewCell {

    //MARK: - IBOutlets and Variables
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var statusButton: UIButton!
    
    var delegate: ItemListCellProtocol?
    var currentItem: TaskModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func onTapStatus(_ sender: Any) {
        guard let item = currentItem else { return }
        if item.status != 2 {
            delegate?.updateItemStatus(item: item)
        }
    }
    
    @IBAction func onTapRemove(_ sender: Any) {
        guard let item = currentItem else { return }
        delegate?.removeItemFromList(item: item)
    }
    
    func updateCellWithData(task: TaskModel) {
        currentItem = task
        timeLabel.text = task.time
        if task.status == 2 {
            titleLabel.attributedText = task.title.strikeThrough()
            statusButton.setImage(ImageConstant.fillCheckBox, for: .normal)
        } else {
            titleLabel.text = task.title
            statusButton.setImage(ImageConstant.emptyCheckBox, for: .normal)
        }
        
        if task.createdAt < Date() && task.status != 2 {
            titleLabel.textColor = ColorConstants.textRed
            statusLabel.isHidden = false
        } else {
            titleLabel.textColor = ColorConstants.textBlack
            statusLabel.isHidden = true
        }
    }
    
    
}
