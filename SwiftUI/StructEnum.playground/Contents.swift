struct SampleStruct{
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildHelloMsg() -> String {
        // 함수의 한줄의 실행구문 결과가 함수의 반환타입과 일치 시 return 생략 가능
        "Hello, \(name)"
    }
}

class SampleClass {
    var name: String
        
    init(name: String){
        self.name = name
    }
        
    func buildHelloMsg() -> String {
        return "Hello " + name
    }
}

// 값 타입: 하나의 인스턴스를 변경해도 복사본들에게 영향을 끼치지 않음
let myStruct1 = SampleStruct(name: "EunJin")
var myStruct2 = myStruct1
myStruct2.name = "EunJin2"
    
print(myStruct1.name)       // 출력: EunJin
print(myStruct2.name)       // 출력: EunJin2
    
// 참조 타입: 하나의 인스턴스 데이터를 변경 시 모든 참조체의 데이터가 변경됨
let myClass1 = SampleClass(name: "EunJin")
var myClass2 = myClass1
myClass2.name = "EunJin2"

print(myClass1.name)       // 출력: EunJin2
print(myClass2.name)       // 출력: EunJin2

enum Temperature {
    case hot
    case warm
    case cold(centigrade: Int)
}

func displayTempInfo(temp: Temperature) {
    switch temp {
    case .hot:
        print("Hot")
    case .warm:
        print("Warm")
    case .cold(let centigrade) where centigrade <= 0:
        print("Ice warning: \(centigrade) degrees.")
    case .cold:
        print("It is cold but not freezing.")
    }
}

displayTempInfo(temp: Temperature.cold(centigrade: -10))
