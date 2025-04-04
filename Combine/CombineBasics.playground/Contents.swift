import Combine
import PlaygroundSupport

// Playground가 비동기 코드를 실행할 수 있도록 설정
PlaygroundPage.current.needsIndefiniteExecution = true

// ==== 예제 1: sink Subscriber - 기본형 ====
print("\n 1. sink Subscriber - 기본형")
print("-----------------------------")

let numbersPublisher = [10, 20, 30, 40, 50].publisher

// sink는 가장 기본적인 Subscriber
// 값을 받아서 클로저 내에서 처리함
let basicSink = numbersPublisher.sink { number in
    print(" 기본 sink로 받은 값: \(number)")
}

basicSink.cancel()  // sink는 사용 후 cancel 해줘야 함

// ==== 예제 2: sink Subscriber - 완료 처리 추가 ====
print("\n 2. sink Subscriber - 완료 이벤트 처리")
print("------------------------------------")

let completionSink = numbersPublisher.sink(
  receiveCompletion: { completion in
    switch completion {
    case .finished:
      print("👉 모든 값 수신 완료!")
    case .failure(let error):
      print("👉 오류 발생: \(error)")
    }
  },
  receiveValue: { number in
    print("👉 값 수신: \(number)")
  }
)

// ===== 예제 5: Demand(요청량) 관리하기 =====
print("\n5️⃣ Demand 관리 - 값 요청량 조절하기")
print("----------------------------------")

// 수용량을 관리하는 커스텀 Subscriber
class LimitedSubscriber: Subscriber {
  typealias Input = String
  typealias Failure = Never

  // 수용 개수를 저장
  private var totalDemand = 0
  private let maxDemand = 2

  func receive(subscription: Subscription) {
    print("👉 최초 2개 값만 요청합니다")
    // 처음에 2개만 요청
    totalDemand = 2
    // 구독자에게 수용량을 전달
    subscription.request(Subscribers.Demand.max(2))
  }

  func receive(_ input: String) -> Subscribers.Demand {
    print("👉 받은 값: \(input), 남은 수용량: \(maxDemand - totalDemand + 1)")

    // 모든 수용량을 사용했으면 더 요청하지 않음
    totalDemand -= 1
    return .none
  }

  func receive(completion: Subscribers.Completion<Never>) {
    print("👉 구독 완료!")
  }
}

// 여러 값을 발행하는 Publisher
let fruitsPublisher = ["사과", "바나나", "딸기", "오렌지", "포도"].publisher
fruitsPublisher.subscribe(LimitedSubscriber())

fruitsPublisher.sink { fruit in
  print("👉 발행된 과일: \(fruit)")
}
