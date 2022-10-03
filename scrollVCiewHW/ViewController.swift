//
//  ViewController.swift
//  scrollVCiewHW
//
//  Created by Арсений on 22.09.22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        return view
    }()

    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 5
        return view
    }()
    let firstTxtFld: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.placeholder = "First"
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(scrollView)
        scrollView.delegate = self
        firstTxtFld.delegate = self
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(firstTxtFld)
        // add txtFields
        for _ in 1...20 {
            let txt = UITextField()
            txt.borderStyle = .roundedRect
            txt.delegate = self
            self.stackView.addArrangedSubview(txt)
        }
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 36),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
 textFieldDidBeginEditing(firstTxtFld)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
 scrollViewShouldScrollToTop(scrollView)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
