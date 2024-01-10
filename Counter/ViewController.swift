//
//  ViewController.swift
//  Counter
//
//  Created by Dmitriy Chicherin on 06.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter: Int = 0                    // Счётчик
    private var dateFormatter = DateFormatter()     // Формат даты и времени

    override func viewDidLoad() {
        super.viewDidLoad()
        CounterLabelRefresh()                       // Устанавливаем счетчик - 0
        TextViewUpdate(with: "Init")                // Пишем в TextView начальную строку и устанавливаем формат даты и времени
    }
    
    @IBAction func countIncButton(_ sender: Any) {
        counter += 1                                // Увеличиваем на 1 значение counter
        CounterLabelRefresh()                       // Вызываем функцию обновления Label
        TextViewUpdate(with: "Increase")            // Вызываем функцию добавления строки TextView с +
    }
    
    @IBAction func countDecButton(_ sender: Any) {
        if counter > 0 {                            // Проверяем, что counter больше 0, чтобы уменьшать
            counter -= 1                            // Уменьшаем на 1 значение counter
            CounterLabelRefresh()                   // Вызываем функцию обновления Label
            TextViewUpdate(with: "Decrease")        // Вызываем функцию добавления строки TextView с -
        } else {
            TextViewUpdate(with: "BelowZero")       //Вызываем функцию добавления строки TextView с <0
        }
    }
    
    @IBAction func countResButton(_ sender: Any) {
        counter = 0                                 // Обнуляем counter
        CounterLabelRefresh()                       // Вызываем функцию обновления Label
        TextViewUpdate(with: "Reset")               // Вызываем функцию добавления строки TextView с 0
    }

    private func CounterLabelRefresh() {            // Функция обновления счётчика
        if let label = self.view.viewWithTag(2) as? UILabel {
            label.text = "Значение счетчика:\n\(counter)"
        }
        
    }
    
    private func TextViewUpdate (with status:String) {          // Функция обновления TextViewUpdate
        if let TextView = self.view.viewWithTag(5) as? UITextView {
            let dateNow = dateFormatter.string(from: Date())
            switch status {
            case "Init":
                TextView.text = "История изменений:"
                dateFormatter.dateFormat = "yy-MM-dd HH:mm:ss"  // Установка формата даты и времени
            case "Reset":
                TextView.text += "\n[\(dateNow)]: значение сброшено"
            case "Increase":
                TextView.text += "\n[\(dateNow)]: значение изменено на +1"
            case "Decrease":
                TextView.text += "\n[\(dateNow)]: значение изменено на -1"
            case "BelowZero":
                TextView.text += "\n[\(dateNow)]: попытка уменьшить значение счётчика ниже 0"
            default:
                print("n/a")
            }
            TextView.scrollRectToVisible(TextView.caretRect(for: TextView.endOfDocument), animated: true) //Скролл на нижнюю строку
        }
    }
}

