//
//  ViewController.swift
//  Counter
//
//  Created by Dmitriy Chicherin on 06.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0    // Переменная счетчика, иницилизируем 0
    
    func counterLabelRefresh() {    // Процедура обновления Label
        if let label = self.view.viewWithTag(2) as? UILabel {   // Получаем доступ к Label
            label.text = "Значение счетчика:\n\(counter)"       // Обновляем значением counter
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabelRefresh()   // При загрузке формы, обновляем Label
    }

    @IBAction func countIncButton(_ sender: Any) {
        counter += 1            // Увеличиваем на 1 значение counter
        counterLabelRefresh()   // Вызываем функцию обновления Label
    }
    
    @IBAction func countDecButton(_ sender: Any) {
        if counter > 0 {        // Проверяем, что counter больше 0, чтобы уменьшать
            counter -= 1        // Уменьшваем на 1 значение counter
            counterLabelRefresh()   // ызываем функцию обновления Label

        }
    }
    
    @IBAction func countResButton(_ sender: Any) {
        counter = 0             // Обнуляем counter
        counterLabelRefresh()   // Вызываем функцию обновления Label
    }
    
    
}

