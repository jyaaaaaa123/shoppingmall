# shoppingmall
#
<p align="center"><img src="https://user-images.githubusercontent.com/72846139/113660238-9fa18180-96de-11eb-815b-ce4683f00927.png" height="300px" width="500px"></p>

## 목차
* 프로젝트 목적
* 개발환경
* 데이터베이스 모델링
* 특징
* 전체 시연 영상

## 프로젝트 목적
  본 프로젝트는 쇼핑몰 구현을 통해 웹 프로그래밍의 기본 필수요소인 CRUD 학습을 위한 여러 기능(상품관리, 회원관리, Q&A게시판 등)을 구현하기 위한 목표로 시작된 프로젝트 입니다. 또한 단순한 CRUD 이외에 ajax, json을 이용한 비동기통신과 스프링 시큐리티를 통한 회원인증 과정을 학습하기 위한 방향으로 진행했습니다.
  
## 개발환경
  > FRONT-END
  * HTML5, CSS3, JavaScript
  * jQuery 3.5.1
  * Bootstrap v5.0.0 beta2
  > BACK-END
  * Spring framework 5.0.7
  * JAVA JDK 1.8
  * Oracle 11g
  * MyBatis 3.4.6
  > IDE
  * STS 3.9.13 RELEASE e4.16.0
  
## 데이터베이스 모델링
![image](https://user-images.githubusercontent.com/72846139/113666938-0167e880-96eb-11eb-940b-12e1f7c7c38d.png)

## 특징
  * 주문목록 JOIN <br>
  이용자 주문 상세 목록 확인을 위해 필요한 3개의 DB테이블(상품, 주문, 주문상세)을 JOIN으로 불러옴 <br> 
  ``` 
	select  o.order_code, o.userid, o.order_name, o.order_phone, o.order_address, 
          o.order_allprice, o.order_day, o.order_complete, 
				  op.order_product_code, op.product_code, op.order_product_stock, op.order_product_comment, 
				  p.product_name, p.product_price
	  from tbl_order o
	  join tbl_order_product op
			on o.order_code = op.order_code
		join tbl_product p
			on op.product_code = p.product_code
		where o.order_code = #{order_code}	
  ```
  ![join](https://user-images.githubusercontent.com/72846139/113808594-48b0b080-97a1-11eb-9703-0f479b51d803.gif)
  
  * AJAX를 이용해서 페이지 변경없이 비동기통신을 진행
  ``` javascript
  //체크시 내 회원정보 불러오기, 체크해제시 삭제
  $("#myInfo").on("click", function(e){
		
		if($("#myInfo").is(":checked")) { //체크가 되고나서 true 정보 불러오기
			var con = confirm("내 정보를 가져오시겠습니까?");
			
			if(con) {
				$.ajax({
					url: "/order/myInfo",
					dataType: "json",
					type: "get",
					success: function(data) {
						$("#name").val(data.userName);
				  		$("#phone").val(data.userphone);
					},
					error: function() {
						alert("실패");
					}	
				});
			} else {
				$("#myInfo").prop("checked", false);
				return;
			}
		} else {
			$("#name").val("name");
  			$("#phone").val("phone");
		}
	});
  ```
  ![ajax](https://user-images.githubusercontent.com/72846139/113809263-b4474d80-97a2-11eb-922d-00c813a784d2.gif)
  
  * 정렬 기능을 위한 서브 쿼리
  > 페이징처리 시 서브쿼리에 order by 이용불가 => 먼저 order by 정렬 후 다시 한 번 서브 쿼리 적용
  ```
  select * from 
			(select * from  
				(select rownum rn, x.*
				from 
					(select 
						tp.product_code, tp.product_ctgr, tp.product_name, 
						tp.product_price, tp.product_explain, tp.product_stock, tp.product_sales, tp.product_regdate,
						tpi.uuid, tpi.uploadPath, tpi.fileName, tpi.filetype
						from tbl_product tp
						LEFT OUTER JOIN tbl_product_image tpi
						ON tp.product_code = tpi.product_code 
						where product_ctgr = #{product_ctgr} 
						]]>
						<choose>
							<when test="cri.type == 'sortPriceD'">
								order by product_price asc
							</when>
							<when test="cri.type == 'sortPriceU'">
								order by product_price desc
							</when>
							<when test="cri.type == 'sortName'">
								order by product_name asc
							</when>
							<when test="cri.type == 'sortRegi'">
								order by product_code desc
							</when>
						</choose>
					) x 
				)
			where rn <= (#{cri.pageNum} * #{cri.amount})
			)	
		where rn > (#{cri.pageNum} - 1) * #{cri.amount}
  ```
  ![sub](https://user-images.githubusercontent.com/72846139/113810414-2de03b00-97a5-11eb-8a7c-1be8948dc905.gif)

## 전체 시연 영상
[![Video Label](http://img.youtube.com/vi/VyblxRh6Cqc/0.jpg)](https://youtu.be/VyblxRh6Cqc)
