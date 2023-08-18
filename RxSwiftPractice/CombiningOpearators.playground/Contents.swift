import UIKit
import RxSwift

let disposeBag = DisposeBag()

print("---startWith-----")

let classYellow = Observable.of("🐶", "🐱", "🐭")

classYellow
    .enumerated()
    .map({ index, element in
        element + "child" + "\(index)"
        
    })
    .startWith("👩‍🦰teachar")
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----concat1-----")
let classYellow2 = Observable.of("🐶", "🐱", "🐭")
let teacher = Observable<String>.of("👩‍🦰teachar")

let walk = Observable
    .concat([teacher, classYellow2])

walk
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
print("-----concat2-----")

teacher
    .concat(classYellow2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----concatMap-----")
let 어린이집: [String: Observable<String>] = [
    "노랑반" : Observable.of("😀", "😃", "😄"),
    "파랑반" : Observable.of("🤣", "🥲")
]

Observable.of("노랑반", "파랑반")
    .concatMap( {반 in
        어린이집[반] ?? .empty()
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("-----merge1-----")
let 강북 = Observable.from(["강북구", "성북구", "동대문구", "종로구"])
let 강남 = Observable.from(["강남구", "강동구", "영등포구", "양천구"])

Observable.of(강북, 강남)
    .merge()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----merge2-----")

Observable.of(강북, 강남)
    .merge(maxConcurrent: 1)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("---combineLatest1-----")

let 성 = PublishSubject<String>()
let 이름 = PublishSubject<String>()

let 성명 = Observable
    .combineLatest(성, 이름) { 성, 이름 in
        성 + 이름
    }
성명
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

성.onNext("김")
이름.onNext("똘똘")
이름.onNext("영수")
이름.onNext("은영")
성.onNext("백")
성.onNext("이")
성.onNext("조")


print("---combineLatest2-----")
let 날짜표시형식 = Observable<DateFormatter.Style>.of(.short, .long)
let 현재날짜 = Observable<Date>.of(Date())

let 현재날짜표시 = Observable
    .combineLatest(
        날짜표시형식,
        현재날짜,
        resultSelector: {형식, 날짜 -> String in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = 형식
            return dateFormatter.string(from: 날짜)
        }
    )

현재날짜
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("---combineLatest3-----")
let lastName = PublishSubject<String>()
let firstName = PublishSubject<String>()

let fullName = Observable
    .combineLatest([firstName, lastName]) { name in
        name.joined(separator: " ")
    }

fullName
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

lastName.onNext("Kim")
firstName.onNext("Paul")
firstName.onNext("Stella")
firstName.onNext("Lily")

print("--------zip---------")
enum 승패 {
    case 승
    case 패
}

let 승부 = Observable<승패>.of(.승, .승, .패, .승, .패)
let 선수 = Observable<String>.of("🇰🇷", "🇬🇭", "🇩🇪", "🇩🇰", "🇩🇿", "🇯🇵")

let 시합결과 = Observable
    .zip(승부, 선수) { 결과, 대표선수 in
        return 대표선수 + "선수" + "\(결과)"
    }

시합결과
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


