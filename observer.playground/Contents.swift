protocol Observer{
    func update(_ notifyValue: Int)
}

class Junseong { //관찰자들이 보고있는 대상
    private var observers: [Observer] = [Observer]()
    private var value: Int = Int()
    
    // 변경을 되면 notify()를 호출
    var number: Int {
        set {
            value = newValue
            notify()
        }
        get {
            return value
        }
    }
    
    //옵저버 등록
    func attatchObserver(_ observer: Observer){
        observers.append(observer)
    }
    //옵저버 해제
    func detachObserver(_ observer: Observer){
        observers.removeLast()
    }
    
    //옵저버 알림
    func notify(){
        for observer in observers{
            observer.update(number)
        }
    }
}

class Sumida: Observer{
    private var name: String = ""
    
    init(name: String){
        self.name = name
    }
    func update(_ notifyValue: Int) {
        print("스미다상이 준성 실력이 \(notifyValue) 으로 변경 된 것을 인식하였습니다.")
    }
}

class Jaeun: Observer{
    private var name: String = ""
    
    init(name: String){
        self.name = name
    }
    func update(_ notifyValue: Int) {
        print("재은상이 준성 실력이 \(notifyValue) 으로 변경 된 것을 인식 하였습니다.")
    }
}

func main(){
    let junseong = Junseong()
    let sumida = Sumida(name: "junseong")
    let jaeun = Jaeun(name: "junseong")
    junseong.attatchObserver(sumida)
    junseong.attatchObserver(jaeun)
    
    junseong.number = 10
    junseong.number = 60
    
    junseong.detachObserver(sumida)
    junseong.detachObserver(jaeun)
    junseong.number = 10
    junseong.number = 60
}

main()
