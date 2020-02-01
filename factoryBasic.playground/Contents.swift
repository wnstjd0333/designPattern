//팩토리 패턴
//공장(protocol)의 생산 라인(method)이 달라지는 것이 아닌, 제품(object)이 달라지는 것
protocol Barrack {
    func makeUnit() -> String
}

class Marine : Barrack {
    func makeUnit() -> String {
        return "마린"
    }
}

class Medic : Barrack {
    func makeUnit() -> String {
        return "메딕"
    }
}

//View에서는 대상이 무엇인지 알 수 없다.
func outputView(_ unit: Barrack) {
    print("배럭에서 \(unit.makeUnit())을 만들었습니다.")
}

//단순히 클래스 생성 로직을 숨긴것
func main(){
    let marine = Marine()
    let medic = Medic()
    
    outputView(marine)
    outputView(medic)
}

main()
