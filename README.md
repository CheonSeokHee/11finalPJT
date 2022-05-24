# mini-PJT

## 1. 
스프링 부트와 다음 주소 오픈 API ( 다음카카오 주소 찾기는 key를 발급 필요도 없으며, 사용량에 대한 제한도 없고, 
기업용이든 상업적 용도이든 상관없이 무조건 무료로 사용 가능하다. 뿐만 아니라 행정자치부에서 제공하는 주소 DB를 직접 업데이트 받고 있으므로 가장 최신의 데이터를 사용할 수 있다.)
이용하여 프로젝트 내에 상품 구매 시 사용자가 주소를 작성할 때 사용할 수 있도록 함
![image](https://user-images.githubusercontent.com/92357194/169927388-3b442326-d66a-41b9-9fd2-660e1aea73cc.png)


![image](https://user-images.githubusercontent.com/92357194/169927422-4e367112-2efa-4afb-9d09-b8ea12812122.png)


## 2. 
- CoolSMS 는 Java, C, Python 등 언어로 특정 휴대전화 번호로 문자를 발송할 수 있는 API를 제공한다.
- 휴대폰 단문, 장문, 포토 메시지 등을 보낼 수 있다
- 번호를 입력 후 [번호확인] 버튼을 누르면 ajax로 input 에 입력된 번호가 controller로 전송된다.
- Random 메소드를 통해 인증번호 4자리를 랜덤 으로 생성
- ajax를 이용해서 랜덤 으로 생성된 4자리의 인증번호와  [인증번호입력] input에 입력된 번호가 일치할 경우 인증 성공


![image](https://user-images.githubusercontent.com/92357194/169927517-ceb84b58-59a2-4b75-8aae-28d77cddd908.png)

![image](https://user-images.githubusercontent.com/92357194/169927543-838bdda2-304d-4a47-a90c-2c9af2940172.png)

![image](https://user-images.githubusercontent.com/92357194/169927566-fe8cc02a-5b59-4c3d-8b4d-b02172f079e8.png)

## 3.
-이 모달창은 팝업창?　과 비슷하게 정보를 전달하나 팝업과 다르게 별도의 창이나 탭을 생성하지 않고 페이지 내에서 레이어를 이용해 정보를 보여준다는 점이 차이점이라고 할 수 있습니다.
ー초기 화면으로 가고 싶다면 오른쪽 상단에 x버튼을 구현하여 나갈 수 있다
-input Tag를 이용하여 아이디와 패스워드를 받고 컨트롤러로 form 해줌
![image](https://user-images.githubusercontent.com/92357194/169927590-9601fecf-fc2b-4fda-b3dc-aeb57c4085ee.png)



## 4.
- 칼럼과 테이블에 userCount를 추가하고 userId를 Count하도록 mapper에 userIdCount sql추가
- 로그인 할 때 필요한 부분이기 때문에 controller의 login 메소드에서 userId를 파라미터로 받은 후 getUserCount에서 값을 받고 session에 담아서 넘겨줌(0일때도 처리 해줌)
- <span class="badge">${userCount}</span></a></li> badge 부트스트림을 사용하여 화면에 뿌려주었다

![image](https://user-images.githubusercontent.com/92357194/169927657-f87e6f12-cc4c-4b89-bd1e-2a169caeb6b2.png)


## 5.
- 경로를 지정해준 uploadFiles 폴더로 업로드한 1038.jpg가 정상적으로 등록된 화면
- - multipartResolver를 bean등록하여 추가
- 기존에 파일이미지 이름과 업로드할 이미지의 데이터 타입이 달라서 MultipartFile proImage 라고 파라미터를 다시 지정해주어 도메인에 가지 못하게 컨트롤러에서 해결
- modelAndView.addObject에 담아서 뿌려줌
- product.setFileName(proImage.getOriginalFilename()) 로 최종 FileName에 set해줌
![image](https://user-images.githubusercontent.com/92357194/169927981-7db155c4-aedf-4ca1-9515-028db25f01bd.png)
![image](https://user-images.githubusercontent.com/92357194/169928112-d3dc540a-413f-42c9-9855-9f9e462ade24.png)






