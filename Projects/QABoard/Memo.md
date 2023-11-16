#  Memo Insight

### ???
    - App Group:
        같은 개발자 계정에 속한 앱들이 데이터 공유할 수 있도록 해준다.
        UserDefaults와 유사하지만 추가적으로 파일을 저장할 수 있다?
        
    - App과 Extension의 관계
    | https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/ExtensionScenarios.html#//apple_ref/doc/uid/TP40014214-CH21-SW1
        extension의 번들이 본 앱의 번들에 중첩되더라도 실행중인 appExtension과 containing app은 서로의 container에 접근 불가능
        App Groups 지정 및 활성화를 통해 containing app과 app extension의 데이터 공유 가능
        UserDefaults 개체를 인스턴스화 하고 App Groups의 식별자를 전달하면 된다.
        
* 나중에 파일을 저장하고 추출한 파일로 다른 기기에서 동기화 하고 싶은 기능을 위해 디바이스에 파일 저장하는게 어떤지
    


