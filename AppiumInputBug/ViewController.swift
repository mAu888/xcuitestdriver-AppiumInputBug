import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = Bundle.main.url(forResource: "index", withExtension: "html")
        let data = try! Data(contentsOf: url!)
        let string = String(data: data, encoding: .utf8)!

        webView.isInspectable = true
        webView.loadHTMLString(string, baseURL: nil)
    }
}
