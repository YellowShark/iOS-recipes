//
//  HTMLStringView.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import SwiftUI

import WebKit
import SwiftUI

struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String
    let fontSize: CGFloat = 40
    let color: UIColor = UIColor(Color.black)
    let linkColor: UIColor = UIColor(Color.blue)
    let fontFamily: String = "Roboto"

    init(_ htmlContent: String) {
        self.htmlContent = """
        <!doctype html>
                <html>
                  <head>
                    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
                    <style>
                        body {
                            color: \(color.hexString!);
                            font-family: \(fontFamily);
                            font-size: \(fontSize)px;
                        }
                        a {
                            color: \(linkColor.hexString!);
                        }
                    </style>
                  </head>
                  <body>
                    \(htmlContent)
                  </body>
                </html>
        """
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}

extension UIColor {
    var hexString:String? {
        if let components = self.cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "#%02x%02x%02x", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}
