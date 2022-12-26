# HSAlert

* HSAlert is a simple Alert

<br/>



### Simulation

![ezgif com-gif-maker (3)](https://user-images.githubusercontent.com/106936018/209522543-71720747-c425-4514-b75d-0d213354c5ee.gif)

### Usage

```swift
// toast
HSAlertController(mainTitle: "확인 하였어요")
    .showAlert(view)


// complete button
HSAlertController(mainTitle: "다운로드 완료 하였습니다", subTitle: "지금부터 마음껏\n이용 하실 수 있습니다.")
    .addCompleteButton()
    .showAlert(view)


// complete, cancel button
HSAlertController(mainTitle: "정말 나가시겠어요?", subTitle: "작성 중인 내용은 임시저장되며\n언제든지 재등록이 가능합니다", font: UIFont.systemFont(ofSize: 20, weight: .semibold) )
    .addCompleteButton()
    .addCancelButton()
    .showAlert(view)
```



<br/>

### Requirements

* iOS 13 + 

* siwft 5 +

<br/>

### Installation

#### Swift Package Manager

```http
https://github.com/haha1haka/HSAlert.git
```

