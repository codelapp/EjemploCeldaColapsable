import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let accion = ["Ironman", "Rambo", "Terminator"]
    let terror = ["El conjuro", "Saw", "El exorcistas"]
    let animacion = ["ToyStory", "Coco", "Cars"]

    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.backgroundColor = UIColor.green
        tabla.separatorColor = UIColor.yellow
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return accion.count
        }else if section == 1 {
            return terror.count
        }else{
            return animacion.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = accion[indexPath.row]
            cell.textLabel?.textColor = UIColor.white
        }else if indexPath.section == 1{
            cell.textLabel?.text = terror[indexPath.row]
            cell.textLabel?.textColor = UIColor.white
        }else{
            cell.textLabel?.text = animacion[indexPath.row]
            cell.textLabel?.textColor = UIColor.white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "ACCION"
        }else if section == 1 {
            return "TERROR"
        }else{
            return "ANIMACION"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.gray
    }


}

