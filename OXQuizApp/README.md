# 💁🏻‍♀️ SwiftUI로 OX 퀴즈 앱 만들기

## 🙋‍♀️ 앱 및 뷰 구조 설명
- **OXQuizApp 구조체**: 앱의 시작점을 정의합니다. `@main` 어노테이션이 붙어 있으며, App 프로토콜을 준수합니다. 메인 화면으로 ContentView를 불러옵니다.
- **ContentView 구조체**: 사용자 인터페이스와 게임 로직을 포함합니다. 사용자는 이 화면에서 퀴즈를 풀게 됩니다.


## 💁🏻‍♀️ 화면 구성
<div class=pull-left>
<img width="250" height="460" alt="image" align='left' src="https://github.com/user-attachments/assets/a5fc704b-b56c-470b-9a3e-1090edbf8319" />
</div>
<div class=pull-right>
<br><br><br><br><br><br>

- **퀴즈 문제**: 두 수의 곱셈 결과를 표시합니다.<br>

- **맞음/틀림 버튼**: 사용자가 정답 혹은 오답을 선택할 수 있습니다.<br>

- **맞음/틀림 버튼**: 사용자가 문제를 맞춘 횟수와 틀린 횟수를 표시합니다.<br>

- **게임 재시작 버튼**: 게임을 초기화하고 새로운 문제를 생성합니다.
  
</div>
<br><br><br><br><br><br>


## Code Block
### Code Line
오답의 비율이 너무 많아 비율을 반반 정도로 맞추기 위해 Bool.random() 을 사용했습니다.<br>
`resultNumber = Bool.random() ? number1 * number2 : Int.random(in: 0...100)`

### Code Block

```swift
func newQuesiont() {
    number1 = Int.random(in: 0...10)
    number2 = Int.random(in: 0...10)
    resultNumber = Bool.random() ? number1 * number2 : Int.random(in: 0...100)
}
```
