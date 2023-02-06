//
//  JokeScreen.swift
//  AppDesafioChuckNorris
//
//  Created by Barbara Brigolin on 05/01/23.
//

import UIKit

enum JokeScreenString: String {
    case logoImage = "cn.logo"
}

class JokeScreen: UIView {
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: JokeScreenString.logoImage.rawValue)
        image.contentMode = .scaleAspectFill
        return image
    }()

    lazy var jokeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        self.addSubview(backgroundView)
        self.backgroundView.addSubview(logoImageView)
        self.backgroundView.addSubview(jokeLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            backgroundView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            backgroundView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            backgroundView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            logoImageView.bottomAnchor.constraint(equalTo: self.backgroundView.bottomAnchor, constant: -10),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            jokeLabel.centerYAnchor.constraint(equalTo: self.backgroundView.centerYAnchor),
            jokeLabel.leadingAnchor.constraint(equalTo: self.backgroundView.leadingAnchor, constant: 10),
            jokeLabel.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor, constant: -10),
            jokeLabel.heightAnchor.constraint(equalToConstant: 200)

        ])
    }
}
