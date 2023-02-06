//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 06/02/2023.
//

import UIKit


@available(iOS 13.4, *)
open class SearchTextField: UITextField {
    
    
    //MARK: - life cycle -
    //
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - init -
    //
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - privte methods -
    //
    private func setupUI() {
        placeholder = "Search in images..."
        setRightPaddingPoints()
        setLeftPaddingPoints()
        setIcon(DesignSystem.SystemImages.search.image)
        
        self.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
    }
    
    @objc private func textFieldEditingDidBegin() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
    }
    @objc private func textFieldEditingDidEnd() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
    }
}
