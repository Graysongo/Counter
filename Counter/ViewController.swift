//
//  ViewController.swift
//  Counter
//
//  Created by Dmitriy Chicherin on 06.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0            // Переменная счетчика, иницилизируем 0
    var dateF = DateFormatter()     // Переменная для формата даты и времени

    
    func CounterLabelRefresh() {    // Процедура обновления Label
        if let label = self.view.viewWithTag(2) as? UILabel {   // Получаем доступ к Label
            label.text = "Значение счетчика:\n\(counter)"       // Обновляем значением counter
        }

    }
    
    func TextViewUpdate (with status:String) {
        if let textView = self.view.viewWithTag(5) as? UITextView {
            let dateNow = dateF.string(from: Date())
            switch status {
            case "Init":
                textView.text = "История изменений:"
                dateF.dateFormat = "yy-MM-dd HH:mm:ss"      // Определение формата даты и времени для лога
            case "Reset":
                textView.text += "\n[\(dateNow)]: значение сброшено"                            //Делаем запись в лог о сбросе
            case "Increase":
                textView.text += "\n[\(dateNow)]: значение изменено на +1"                      //Делаем запись в лог об увеличении значения
            case "Decrease":
                textView.text += "\n[\(dateNow)]: значение изменено на -1"                      //Делаем запись в лог об уменьшении значения
            case "BelowZero":
                textView.text += "\n[\(dateNow)]: попытка уменьшить значение счётчика ниже 0"   //Делаем запись в лог о попытке уменьшения ниже границы
            default:
                print("n/a")
            }
            textView.scrollRectToVisible(textView.caretRect(for: textView.endOfDocument), animated: true) // Скролл на новую строчку
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CounterLabelRefresh()                       // При загрузке формы, обновляем Label - устанавливаем 0
        TextViewUpdate(with: "Init")                // При загрузке формы пишем в TextView базовую строчку и устанавливаем формат даты и времени
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

