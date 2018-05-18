import UIKit

struct Peliculas {
    var abrir = Bool()
    var genero : String
    var pelicula = [String]()
}

class ExpandibleViewController: UITableViewController {
    
    var lista = [Peliculas]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lista = [Peliculas(abrir: false, genero: "ACCION", pelicula: ["Ironman", "Rambo", "Terminator"]),
                 Peliculas(abrir: false, genero: "TERROR", pelicula: ["El conjuro", "Saw", "El exorcistas"]),
                 Peliculas(abrir: false, genero: "ANIMACION", pelicula: ["ToyStory", "Coco", "Cars"])]
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return lista.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if lista[section].abrir == true {
            return lista[section].pelicula.count + 1
        }else{
           return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = lista[indexPath.section].genero
            cell.textLabel?.textColor = UIColor.blue
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = lista[indexPath.section].pelicula[indexPath.row - 1]
            cell.textLabel?.textColor = UIColor.black
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            if lista[indexPath.section].abrir == true {
                lista[indexPath.section].abrir = false
                let secciones = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(secciones, with: .fade)
            }else{
                lista[indexPath.section].abrir = true
                let secciones = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(secciones, with: .fade)
            }
        }
        
    }
}
