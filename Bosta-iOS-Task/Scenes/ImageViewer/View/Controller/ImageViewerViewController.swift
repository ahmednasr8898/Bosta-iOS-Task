//
//  
//  ImageViewerViewController.swift
//  Bosta-iOS-Task
//
//  Created by Ahmed Nasr on 06/02/2023.
//
//

import UIKit


class ImageViewerViewController: UIViewController {
    
    //MARK: - outlets -
    //
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var albumPhotoImageView: UIImageView!
    
    //MARK: - properties -
    //
    private let viewModel: ImageViewerViewModelType
    
    //MARK: - init -
    //
    init(viewModel: ImageViewerViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle -
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        addShareBarButtonItem()
        delegateScrollView()
        setAlbumImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


//MARK: - add share bar button item -
//
extension ImageViewerViewController {
    private func addShareBarButtonItem() {
        let shareButton = UIBarButtonItem(title: ImageViewerConstants.shareButton, style: .plain, target: self, action: #selector(shareButtonWasTapped))
        navigationItem.setRightBarButton(shareButton, animated: true)
    }
    
    @objc private func shareButtonWasTapped() {
        guard let imageUrl = self.viewModel.getImagePathUrl() else { return }
        share(view: view, url: imageUrl)
    }
}


//MARK: - zomming in image view -
//
extension ImageViewerViewController: UIScrollViewDelegate {
    private func delegateScrollView() {
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return albumPhotoImageView
    }
}


//MARK: - set Album image -
//
extension ImageViewerViewController {
    private func setAlbumImage() {
        albumPhotoImageView.setImage(url: viewModel.getImagePathUrl())
    }
}
