import UIKit

func checkPassword(_ password: String) -> Bool {
    if password.isEmpty { return false }
    if !password.first!.isUppercase { return false }
    if password.count < 5 || password.count > 15 { return false }
    if (password.first(where: { $0.isLowercase }) == nil) { return false }
    if (password.first(where: { $0.isNumber }) == nil) { return false }
    if (password.first(where: { $0.isPunctuation }) != nil) { return false }
    let arrayPass = password.map( { $0 })
    var withoutSequence = true
    for (index, pass) in arrayPass.enumerated() {
        if index + 2 < arrayPass.endIndex && arrayPass[index + 1].isNumber && arrayPass[index + 2].isNumber && pass.isNumber {
            let numbers = "\(pass)\(arrayPass[index + 1])\(arrayPass[index + 2])"
            withoutSequence = numbers != String(numbers.sorted())
        }
    }
    return withoutSequence
}

let pass = "Te1st2e3"
checkPassword(pass) ? print("senha forte") : print("não atende aos requisitos!")
