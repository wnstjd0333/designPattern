//어플리케이션이 실행을 하여 단 한번만 메모리에 할당 된 후 그 메모리의 인스턴스를 할당 받아 사용하는 디자인 패턴
//대표적인 사용 이유 : 메모리 낭비 방지, 데이터 공유
//환경설정, 네트워크 연결처리, 데이터관리의 경우 많이 사용
class SingleTon{
    static let sharedInstance = SingleTon()
    
    private lazy var name: String = ""
    private lazy var age: Int = 0
    
    private init(){ }
    
    func setProperty(){
        self.name = "junseong"
        self.age = 27
    }
    
    func getProperty() -> (String, Int){
        return(self.name, self.age)
    }
}

func main(){
    let firstInstance = SingleTon.sharedInstance
    let secondInstance = SingleTon.sharedInstance
    
    firstInstance.setProperty()
    
    if(firstInstance === secondInstance){
        print(firstInstance.getProperty())

    }
}

main()
