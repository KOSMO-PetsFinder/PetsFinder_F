<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 유기동물 리스트 -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>    
    <script src="https://kit.fontawesome.com/54b3b8eebf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value='/' />css/calendar.css">
    <title>Petsitters</title>
    <style>
      * {
        font-family: SpoqaHanSans,'BM JUA_TTF', sans-serif;
      }
      p {
        margin-bottom: 0
      }
      a {
        text-decoration: none;
      }
      div.adoptPlus_btn {
        display: flex;
        justify-content: space-between;
        margin-top: 50px
      }
      .ad_plus {
        display: flex; 
        justify-content: center;
        align-items: center; 
        background-color: #71A2FF; 
        color: white; 
        margin: 10px 20px 40px 0; 
        border-radius: 26px; 
        width: 300px; 
        height: 60px; 
      }
    </style>
    </head>
  	<body>
  	<jsp:include page="../common/Header.jsp" />
    <script>
    
    $(function() {
	    $.datepicker.setDefaults({
	      dateFormat: 'yy-mm-dd',
	      prevText: '이전 달',
	      nextText: '다음 달',
	      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	      showMonthAfterYear: true,
	      yearSuffix: '년',
	      maxDate: 'D + 90',
	      showButtonPanel: true,
	      closeText : "닫기",
	    });
        $('#startDate').datepicker({
        	minDate: 'D',
        	onSelect : function(dateText){
        		$('#endDate').datepicker("option", "minDate", dateText);
        		$('#endDate').val('');
	       		$('#endDate').datepicker("show");
        	},
        	onClose : function(dateText) {
        		$('#sD').val(dateText);
        	}
        });
        
        $('#endDate').datepicker({
        	minDate: 'D',
        	numberOfMonths: [1,2],
        	onSelect : function(dateText) {
        		$('#startDate').datepicker("option", "maxDate", dateText);
        		$('#cal_img').datepicker("option", "maxDate", dateText);
        		$('#eD').val(dateText);
        		location.href="<c:url value='/' />petsitters/list?sD=" + $('#sD').val() + "&eD=" + $('#eD').val();
        	},
        });
        
        $('#cal_img').datepicker({
        	minDate : 'd',
        	onSelect : function(dateText) {
        		$('#startDate').datepicker("setDate", dateText);
        	}
        });

    });
    </script>
    <!-- main_menu -->
    <!-- main_menu -->
    <div style="display: flex; justify-content: center; flex-direction: column; padding-top: 180px; padding-bottom:85px; align-items: center; box-shadow: rgba(0, 0, 0, 0.05) 0px 2px 20px;">
      <div style="display: flex; justify-content: space-between; width: 1024px">
        <div style="margin-right: 48px;">
          종류 및 성별
          <form action="">
            <div  style="width: 300px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top:27px; padding: 0 24px 0 17px">
              <div>
                <button type="submit" style="border: 0; background: none"><i class="fa-solid fa-magnifying-glass"></i></button>
              </div>
              <div>
                <select
                  id=""
                  name="species"
                  style="width: 100px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px"
                >
                  <option value="">선택</option>
                  <option value="dog">강아지</option>
                  <option value="cat">고양이</option>
                </select>
              </div>
              <div>
                <select
                  id=""
                  name="age"
                  style="width: 100px; height: 52px; border: 0; margin: 0px 12px; padding: 1px 2px"
                >
                  <option value="">선택</option>
                  <option value="1">1살</option>
                  <option value="2">2살</option>
                  <option value="3">3살</option>
                  <option value="4">4살</option>
                  <option value="5">5살이상</option>
                  <option value="10">10살이상</option>
                </select>
              </div>
            </div>
          </form>
        </div>
        <form action="./ListSearch">
        <input type="hidden" id="sD" name="sD"/>
        <input type="hidden" id="eD" name="eD"/>
        
        <div>
          등록일
          <div style="width: 475px; height: 59px; display: flex; align-items: center; border: 1px solid #cccccc; padding: 0 24px 0 17px; margin-top: 27px;">
            <!-- DatePicker -->
            <input id="cal_img" type="image" style="border: 0; background-color: white; width: 30px; height: 30px" src="<c:url value='/' />images/calendar.png"/>
              <!-- <img src="/image/calendar.png" style="width: 30px; height: 30px" /> -->
            <div style="display: flex; align-items: center">
              <input
                type="text"
                id="startDate"
                name="startDate"
                class="datepicker_input"
                placeholder="시작 날짜"
                autocomplete="off"
                aria-describedby="DateInput__screen-reader-message-startDate"
                style="border: 0; outline: 0; width: 150px; height: 46px; padding: 11px 11px 9px; margin: 0 0 0 20px"
              />
              <div style="width: 30px; padding-left: 15px">
                <img width="15" height="10" src="<c:url value='/' />images/arrow-calendar.png" />
              </div>
              <div>
                <input
                  type="text"
                  id="endDate"
                  name="endDate"
                  class="datepicker_input"
                  placeholder="종료 날짜"
                  autocomplete="off"
                  aria-describedby="DateInput__screen-reader-message-endDate"
                  style="border: 0; outline: 0; width: 150px; height: 46px; padding: 11px 11px 9px; margin: 0 0 0 20px"
                />
              </div>
            </div>
          </div>
        </div>
        </form>
      </div>
    <!-- middle(소스 가져옴) : DB에서 가져와서 출력하도록 변경해야 함. -->
    <div style="width: 100%; display: flex; flex-direction: column; align-items: center; padding-top: 130px">
      <div style="width: 100%; display: flex; flex-direction: column; align-items: center; margin-bottom: 120px">
        <div style="width: 1024px; display: flex; justify-content: space-between; align-items: center">
          <p style="font-size: 23px; color: #393c47; letter-spacing: -0.2px; font-weight: 600">모든 아이들을 만나보세요</p>
        </div>
        <!-- 첫 번째 줄 -->
        <c:forEach items="${lists }" var="row" varStatus="vs">
	        <c:if test="${vs.index%4 == 0  }">
				<div style="width: 1024px; margin-top: 50px; display: flex; justify-content: space-between">
			</c:if>	
			<a href="./adoptView.do?abani_idx=${row.abani_idx }" target="_blank" style="margin-right: 14px">
            <div>
              <div style="width: 245px; height: 170px; border-radius: 3px">
                <img src="./images/4.png" alt="아이 사진" style="width: 245px; height: 170px; border-radius: 3px">
              </div>
              <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 20px">
              <c:choose> 
			  	<c:when test="${row.abani_species eq 'cat'}"> 
					고양이
				</c:when> 
				<c:otherwise> 
					강아지
				</c:otherwise> 
			  </c:choose>  
                 - ${row.abani_kind } 
              </p>
              <p style="font-size: 16px; letter-spacing: -0.2px; line-height: 20px; color: #383c48; margin-top: 5px">
                ${row.abani_age }
              </p>
              <div style="display: flex; margin-top: 10px; width: 80px; justify-content: space-between; align-items: center">
                <div style="width: 100px; display: flex; justify-content: space-between">
                    ${row.abani_char }
                </div>
              </div>
            </div>
	        </a>
	        <c:if test="${vs.index%4 == 3}">
				</div>
			</c:if>	
        </c:forEach>
        <br />
        <div class="adoptPlus_btn">
        <!-- 문법 -->
        <c:if test="${moreStop eq 0 }">
	          <a class="ad_plus" href="./abanAniList.do?nowPage=${nowPage }" >
	            <p style="font-size: 18px; margin-bottom: 0; font-weight: bold;"> + 더보기</p>
	          </a>
        </c:if>
        </div>
      </div>
    </div>
<!-- <div style="width: 100%; height: 2488px;"></div> -->
  <!-- app02 -->
  <div class="container-fluid" style="height: 430px; display: flex; align-items: flex-end; justify-content: center; background-color: #6C9CFB;">
    <div style="width: 1440px; display: flex; justify-content: space-between; padding-left: 210px; padding-right: 152px;">
      <div style="display: flex; align-items: center; justify-content: space-between; flex-grow: 1;">
        <!-- left -->
        <div style="display: flex; flex-direction: column; align-items: center; align-self: center;">
          <p style="font-size: 38px; line-height: 55px; font-weight: bold; color: white;">
            간단한 소개
          </p>
        </div>
        <!-- right -->
        <div>
          <!-- 입양 관련 이미지 -->
          <img src="" alt="" style="width: 435px; height: 350px;">
        </div>
      </div>
    </div>
  </div>
  </body>
</html>
