import UIKit
import SharedCode

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.text = "sum(3,5):\(CommonKt.sum(a: 3, b: 5))"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let operation = AddOperation.init(a: 5, b: 7)
            label.text = "sum(5,7):\(operation.result())"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            let personList = CommonKt.getPersons()
            var labelText = ""
            for person in personList {
                labelText = "\(labelText) \(person.name), \(person.getSurname()) --- "
            }
            label.text = labelText
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            CommonKt.getPersonsAsync { personList in
                var labelText = ""
                for person in personList {
                    labelText = "\(labelText) \(person.name), \(person.getSurname()) --- "
                }
                label.text = labelText
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            label.text = CommonKt.createApplicationScreenMessage()
        }
        
        view.addSubview(label)
    }
}
