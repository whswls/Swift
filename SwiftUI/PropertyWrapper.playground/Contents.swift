
struct Address {
    private var cityName: String = ""
    var city: String {
        get { cityName }
        set { cityName = newValue.uppercased() }
    }
}

var address: Address = Address()
address.city = "Chicago"
print(address.city)

@propertyWrapper
struct FixCase {
    private(set) var value: String = ""
    // 유효성 검사하는 getter, setter 코드가 포함된 wrappedValue 프로퍼티는 필수로 가져야함
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}
struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    @FixCase var country: String
    
    // 기본 생성자 생략 가능
//    init(name: String, city: String, country: String) {
//        self.name = name
//        self.city = city
//        self.country = country
//    }
}

var contact: Contact = Contact(name: "John", city: "Chicago", country: "USA")
print("contack: \(contact.name), \(contact.city), \(contact.country)")

@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    let min: V
    let max: V
    
    init(wrappedValue initialValue: V, min: V, max: V) {
        self.min = min
        self.max = max
        value = initialValue
    }
    
    var wrappedValue: V {
        get { value }
        // 조건을 가지고 변수 할당을 대신 처리하는 set 함수
        set {
            // 최대값을 넘는 경우 최대값으로 변수의 값을 지정
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

struct IntDemo {
    @MinMaxVal(min: 1, max: 1500) var value: Int = 100
}

var demo = IntDemo()
demo.value = 1000
print(demo.value)   // 출력: 1000

demo.value = 2000
print(demo.value)   // 출력: 1500(max값으로 제한되기 때문)

struct StringDemo {
    @MinMaxVal(min: "Apple", max: "Orange") var value: String = ""
}

var stringDemo = StringDemo()
stringDemo.value = "Banana"
print(stringDemo.value)     // 출력: Banana

stringDemo.value = "Pear"
print(stringDemo.value)    // 출력: Orange
