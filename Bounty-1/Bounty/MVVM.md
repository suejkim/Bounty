### Design Pattern

- 기술부채 최소화
- 재사용 및 지속가능한 코드 만들기

### MVC ( 옛날 ) : (Model - View - Controller)
- Model : 앱 내에서 사용하는 데이터 (struct, class)
- View : 화면에 보여지는 UI요소(UIView)
- Controller : 중개자(UIViewController). 모델 뷰 사이에 의사소통 중개자. 컨트롤러 역할이 많아지면서 massive view controller가 됨

### MVVM ( 최근 ) : (Model- View - ViewModel)
- Model : 데이터(struct)
- View : UI요소(UIView, UIViewController)
- ViewModel: 중개자. ViewModel이라는 클래스 만들어서 수행


### 리팩토링
- 중복제거
- 단일 책임 갖기

##### *10,200Rule* : method는 10줄 이내, 클래스는 200줄 이내 작성
