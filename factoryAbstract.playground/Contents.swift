enum Race {
    case terran, zerg, protoss
}

enum UnitType{
    case marine, medic, zergling, hydra, zealot, dragon
}

protocol Unit{
    func attack()
    func move()
    func stop()
}

protocol Building {
    func make(_ type: UnitType) -> Unit?
}

class Marine: Unit{
    func attack(){print("마린 공격")}
    func move(){print("마린 무브")}
    func stop(){print("마린 정지")}
}
class Medic: Unit {
    func attack(){print("메딕 치료")}
    func move(){print("메딕 무브")}
    func stop() {print("메딕 정지")}
}

class TerranBuilding : Building {
    func make(_ type: UnitType) -> Unit? {
        switch type {
        case .marine:
            return Marine()
        case .medic:
            return Medic()
        default: return nil
        }
    }
}

class Zergling: Unit{
    func attack() {print("저글링 공격")}
    func move(){print("저글링 무브")}
    func stop(){print("저글링 정지")
    }
}
class Hydra: Unit{
    func attack() {print("히드라 공격")}
    func move(){print("히드라 무브")}
    func stop(){print("히드라 정지")
    }
}

class ZergBuilding : Building {
    func make(_ type: UnitType) -> Unit? {
        switch type {
        case .zergling:
            return Zergling()
        case .hydra:
            return Hydra()
        default: return nil
        }
    }
}

class Zealot: Unit{
    func attack() {print("질럿 공격")}
    func move(){print("질럿 무브")}
    func stop(){print("질럿 정지")
    }
}
class Dragon: Unit{
    func attack() {print("드라군 공격")}
    func move(){print("드라군 무브")}
    func stop(){print("드라군 정지")
    }
}

class ProtossBuilding: Building{
    func make(_ type: UnitType) -> Unit? {
        switch type {
        case .zealot:
            return Zealot()
        case .dragon:
            return Dragon()
        default: return nil
        }
    }
}

class User {
    var race: Race
    
    init(_ race: Race){
        self.race = race
    }
    func buildBuilding() -> Building {
        switch race {
        case .zerg:
            return ZergBuilding()
        case .terran:
            return TerranBuilding()
        case .protoss:
            return ProtossBuilding()
        }
    }
    func make(_ unit: UnitType) -> Unit? {
        return buildBuilding().make(unit)
    }
}
//연관된 혹은 의존성이 있는 객체의 그룹을 구체적인 클래스를 지정하지 않고 생성하기 위해 인터페이스를 제공
//어떤 종족을 사용할지 결정만 하면 그 하위 유닛들은 그에 따라 변경되도록 하는 것
//객체가 많아질수록 관리하기 어렵다.
func main(){
    let user1 = User(.zerg)
    let zergUnit1 = user1.buildBuilding().make(.zergling)
    zergUnit1?.attack()
    let zergUnit2 = user1.make(.hydra)
    zergUnit2?.move()
    print("------------")
    
    let user2 = User(.protoss)
    let protossUnit1 = user2.make(.zealot)
    protossUnit1?.stop()
    let protossUnit2 = user2.make(.dragon)
    protossUnit2?.attack()
    print("------------")
    
    let user3 = User(.terran)
    let terranUnit1 = user3.make(.marine)
    terranUnit1?.stop()
    let terranUnit2 = user2.make(.hydra)
    terranUnit2?.attack()
    let terranUnit3 = user3.make(.zealot)
    terranUnit3?.move()
}
main()
