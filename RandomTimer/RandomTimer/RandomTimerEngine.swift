import Foundation
import SwiftUI

class RandomTimerEngine {
    // функция, которая берет на вход число часов и количество уведомлений и отдает массив с рандомным временем по количеству уведомлений
    
    private var randomIntsArray = [Int]()
    
    func timeToAlert(hours: Int, alerts: Int)->[Int]{
        let minutes = hours * 60
      
        
        while randomIntsArray.count != alerts  {
            let random = Int.random(in: 5...minutes)
            if !randomIntsArray.contains(random)  {
            randomIntsArray.append(random )
                }
            }
        
        print(randomIntsArray.sorted())
        return randomIntsArray.sorted()
    }
    
    func wakeUpAlert(){
        
    }
    // функция которая вызывет алерт по расписанию
}
