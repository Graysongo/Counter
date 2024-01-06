//
//  ViewController.swift
//  Counter
//
//  Created by Dmitriy Chicherin on 06.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0    // Переменная счетчика, иницилизируем 0
    
    func CounterLabelRefresh() {    // Процедура обновления Label
        if let label = self.view.viewWithTag(2) as? UILabel {   // Получаем доступ к Label
            label.text = "Значение счетчика:\n\(counter)"       // Обновляем значением counter
        }

    }
    
    func TextViewUpdate (with status:String) {
        if let textView = self.view.viewWithTag(5) as? UITextView {
            switch status {
            case "Init":
                textView.text = "История изменений:"
            case "Reset":
                textView.text += "\n[дата и время]: значение сброшено"
            case "Increase":
                textView.text += "\n[дата и время]: значение изменено на +1"
            case "Decrease":
                textView.text += "\n[дата и время]: значение изменено на -1"
            case "BelowZero":
                textView.text += "\n[дата и время]: попытка уменьшить значение счётчика ниже 0"
            default:
                print("n/a")
            }
            textView.scrollRectToVisible(textView.caretRect(for: textView.endOfDocument), animated: true) // Скролл на сдвиг каретки
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CounterLabelRefresh()   // При загрузке формы, обновляем Label
        TextViewUpdate(with: "Init")
    }

    @IBAction func countIncButton(_ sender: Any) {
        counter += 1            // Увеличиваем на 1 значение counter
        CounterLabelRefresh()   // Вызываем функцию обновления Label
        TextViewUpdate(with: "Increase") //Вызываем функцию добавления строки TextView с +
    }
    
    @IBAction func countDecButton(_ sender: Any) {
        if counter > 0 {        // Проверяем, что counter больше 0, чтобы уменьшать
            counter -= 1        // Уменьшваем на 1 значение counter
            CounterLabelRefresh()   // Вызываем функцию обновления Label
            TextViewUpdate(with: "Decrease") //Вызываем функцию добавления строки TextView с -
        } else {
            TextViewUpdate(with: "BelowZero")//Вызываем функцию добавления строки TextView с <0
        }
    }
    
    @IBAction func countResButton(_ sender: Any) {
        counter = 0             // Обнуляем counter
        CounterLabelRefresh()   // Вызываем функцию обновления Label
        TextViewUpdate(with: "Reset") //Вызываем функцию добавления строки TextView с 0
    }
    
    
}

