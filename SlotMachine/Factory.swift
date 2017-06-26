

import Foundation
import UIKit

class Factory {
    class func createSlots () -> [[Slot]] {
        
        var kNumberOfSlots = 3
        var kNumberOfContainers = 3
        var slots: [[Slot]] = []
        for containerNumber in 0 ..< kNumberOfContainers  {
            var slotArray:[Slot] = []
            for slotNumber in 0 ..< kNumberOfSlots  {
                let slot = Factory.createSlot(slotArray)
                slotArray.append(slot)
                kNumberOfSlots += 1
            }
            print(slotArray)
            slots.append(slotArray)
            kNumberOfContainers += 1
        }
        return slots
    }
    
    class func createSlot (_ currentCards : [Slot]) -> Slot {
        var currentCardValues:[Int] = []
        for slot in currentCards {
            currentCardValues.append(slot.value)
        }
        var randomNumber = Int(arc4random_uniform(UInt32(20)))
        while currentCardValues.contains(randomNumber + 1) {
            randomNumber = Int(arc4random_uniform(UInt32(20)))
        }

        print(randomNumber)
        var slot:Slot
        switch randomNumber {
        case 0:
            slot = Slot(value: 1, image: UIImage(named: ""), isRed: true)
        case 1:
            slot = Slot(value: 2, image: UIImage(named: ""), isRed: true)
        case 2:
            slot = Slot(value: 3, image: UIImage(named: ""), isRed: true)
        case 3:
            slot = Slot(value: 4, image: UIImage(named: ""), isRed: true)
        case 4:
            slot = Slot(value: 5, image: UIImage(named: ""), isRed: false)
        case 5:
            slot = Slot(value: 6, image: UIImage(named: ""), isRed: false)
        case 6:
            slot = Slot(value: 7, image: UIImage(named: ""), isRed: true)
        case 7:
            slot = Slot(value: 8, image: UIImage(named: ""), isRed: false)
        case 8:
            slot = Slot(value: 9, image: UIImage(named: ""), isRed: false)
        case 9:
            slot = Slot(value: 10, image: UIImage(named: ""), isRed: true)
        case 10:
            slot = Slot(value: 11, image: UIImage(named: ""), isRed: false)
        case 11:
            slot = Slot(value: 12, image: UIImage(named: ""), isRed: false)
        case 12:
            slot = Slot(value: 13, image: UIImage(named: ""), isRed: true)
        default:
            slot = Slot(value: 0, image: UIImage(named: ""), isRed: true)
        }
        return slot
    }
}
