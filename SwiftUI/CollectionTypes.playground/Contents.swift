var tree: [String] = ["Pine", "Oak", "Yew"]
var tree2: Array<String> = ["Pine", "Oak", "Yew"]

var emptyArray: [String] = []
var emptyArray2: Array<String> = ["Pine", "Oak", "Yew"]

var nameArray = [String](repeating: "My String", count: 10)

var firstArray = ["Red", "Green", "Blue"]
let secondArray = ["Indigo", "Violet"]
let thirdArray = firstArray + secondArray + tree

firstArray.append("Orange")

print(thirdArray.count)

if !thirdArray.isEmpty {
    print("thirdArray는 비어있지 않습니다.")
}

if thirdArray.contains("Oak") {
    print("thirdArray는 \"Oak\"를 가지고 있습니다.")
}

// 배열 인덱스 1번에 Maple 값 추가
firstArray.insert("Maple", at: 1)

// 1000 > 1004 > 1008 > 1012
// 0 * 4 > 1 * 4 > 2 * 4 > 3 * 4

firstArray += secondArray       // firstArray = firstArray + secondArray

// 베열 인덱스를 이용한 삭제
firstArray.remove(at: 1)

// where 조건이 참인 요소 전부를 삭제
firstArray.removeAll(where: { $0 == "Blue" })

// 마지막 요소 삭제 후 해당 요소 값 반환
let removeItem = firstArray.removeLast()
print(removeItem)

// 배열 값 모두 삭제
firstArray.removeAll()

// 배열의 요소 반복
secondArray.forEach { print($0) }

for item in secondArray {
    print(item)
}

// Any 혼합 타입 캐스팅
let mixedArray: [Any] = ["A String", 432, 34.989]

for object in mixedArray {
    if let intValue = object as? Int {
        print(intValue)
    } else if let doubleValue = object as? Double {
        let roundedValue = doubleValue.rounded()
        print(roundedValue)
    } else if let stringValue = object as? String {
        print(stringValue)
    }
}

// Dictionary
var bookDictionary: [String: String] = [
    "100-432112": "Wind in the Willows",
    "100-432113": "The Secret Garden",
    "100-432114": "The Little Prince",
    "100-432115": "The Lion, the Witch, and the Wardrobe"
]

var myDictionary = [Int: String]()

let keys = ["100-432112", "100-432113", "100-432114", "100-432115"]
let values = ["Wind in the Willows", "The Secret Garden", "The Little Prince", "The Lion, the Witch, and the Wardrobe"]

var bookDict = Dictionary(uniqueKeysWithValues: zip(keys, values))
print(bookDict.count)
print(bookDict["200-532874"] ?? "Book not found")

bookDict.updateValue("The Ruins", forKey: "200-532874")

bookDict["300-8998841"] = "The Overlook"

bookDict["300-898871"] = nil        // 값 제거
bookDict.removeValue(forKey: "300-898871")

for (key, value) in bookDict {
    print("key: \(key), value: \(value)")
}

