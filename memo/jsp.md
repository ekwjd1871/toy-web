# jsp 파일을 인식하게 하기 위한 조건
---
＊ 프로젝트에 web 리소스 경로를 잡아줄 것<br>
> 기존 SpringBoot 의 경우, static 경로에 html 파일을 둠
> 이 때 jsp 를 사용하기 위해서는 web 경로를 새로 잡아주고 그 안에 jsp 를 두어야함<br>
> ./src/main/webapp/

＊ .jsp 파일을 인식하도록 설정을 추가해 줄 것<br>
> &nbsp;&nbsp;&nbsp;예) SpringBoot 환경에서 application.properties 에 설정<br>
> &nbsp;&nbsp;&nbsp;예) Servlet 환경 에서 web.xml 에서 관련 설정
>

＊ 라이러리에 관련 의존성이 있는지 확인 할 것<br>
> 의존성 없을 시, 404 ERROR 발생함 
>
>
＊ 톰캣에서 기본적으로 index.html 을 root 로 인식하므로, 해당 파일이 존재하는지 볼 것<br>
＊ 그런 후, index.jsp 를 만들면 해당 파일을 루트로 인식함


