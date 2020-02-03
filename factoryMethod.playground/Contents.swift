//팩토리 메서드 패턴
protocol Unit{
    func attack()
    func move()
    func stop()
}

enum UnitType{
    case marine, medic
}

class Marine: Unit{
    func attack(){
        print("마린 공격")
    }
    func move(){
        print("마린 무브")
    }
    func stop(){
        print("마린 정지")
    }
}
class Medic: Unit {
    func attack(){
        print("메딕 치료")
    }
    func move(){
        print("메딕 무브")
    }
    func stop() {
        print("메딕 정지")
    }
}

class Barrack {
    func make(_ type: UnitType) -> Unit {
        switch type {
        case .marine:
            return Marine()
        case .medic:
            return Medic()
        }
    }
}
//팩토리 메소드 패턴
//객체 생성을 위한 인터페이스를 정의하지만 이를 구현한 객체가 어떤 클래스를 생성할지 정한다.
//인터페이스 구현 객체에게 객체의 생성을 위임한다.
//유닛의 클래스를 몰라도 생성, 그리고 유닛을 사용할 수 있다.
func main(){
    let barrack = Barrack()
    let marine1 = barrack.make(.marine)
    marine1.attack()
    marine1.move()
    let medic1 = barrack.make(.medic)
    medic1.attack()
    medic1.stop()
}
main()
