//
//  QuoteViewController.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import UIKit

final class QuoteViewController: UIViewController {
    private let quoteLabel = UILabel()
    private let authorLabel = UILabel()
    private let button = UIButton(type: .system)

    private let viewModel = QuoteViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.fetchQuote()
    }

    private func setupUI() {
        view.backgroundColor = .white

        quoteLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        quoteLabel.numberOfLines = 0
        quoteLabel.textAlignment = .center

        authorLabel.font = UIFont.italicSystemFont(ofSize: 18)
        authorLabel.textColor = .darkGray
        authorLabel.textAlignment = .center

        button.setTitle("Yeni İlham Ver", for: .normal)
        button.addTarget(self, action: #selector(fetchNewQuote), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [quoteLabel, authorLabel, button])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func fetchNewQuote() {
        viewModel.fetchQuote()
    }
}

extension QuoteViewController: QuoteViewModelDelegate {
    func didReceiveQuote(_ quote: ZenQuote) {
        quoteLabel.text = "\"\(quote.content)\""
        authorLabel.text = "- \(quote.author)"
    }

    func didFailWithError(_ error: Error) {
        quoteLabel.text = "Bir hata oluştu."
        authorLabel.text = error.localizedDescription
    }
}
