<%@page import="java.util.ArrayList"%>
<%@page import="com.wsbh.c.dao.Dao"%>
<%@page import="com.wsbh.c.dto.Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/index.css?ver=<%= System.currentTimeMillis() %>">

</head>
<body>
<!-- 필드셋 설정 -->
	<div id="layout1">
		<fieldset id="gender_box">
			<legend>성별</legend>
			<a href="/board/gender_box?gender=남자">남자</a><br>
			<a href="/board/gender_box?gender=여자">여자</a><br>
		</fieldset>
			
		<fieldset id="unit_Box">
			<legend>타입</legend>
			<a href ="/board/unit_box?unit=근접딜러">근접딜러</a><br>
			<a href ="/board/unit_box?unit=중거리딜러">중거리딜러</a><br>
			<a href ="/board/unit_box?unit=원거리딜러">원거리딜러</a><br>
			<a href ="/board/unit_box?unit=서포터">서포터</a><br>
		</fieldset>
		
		<fieldset id="cost_Box">
			<legend>세팅 비용</legend>
			<a href ="/board/cost_box?cost=비교적 높음">비교적 높음</a><br>
			<a href ="/board/cost_box?cost=비교적 낮음">비교적 낮음</a><br>
		</fieldset>
		
		<fieldset id="type1_Box">
			<legend>공격타입</legend>	
			<a href ="/board/type1_box?type1=지속딜러">지속딜러</a><br>
			<a href ="/board/type1_box?type1=한방이 강한 딜러">한방이 강한 딜러</a><br>
		</fieldset>	
				
		<fieldset id="type2_Box">
			<legend>공격타입2</legend>	
			<a href ="/board/type2_box?type2=1">사이클형 딜러</a><br>
			<a href ="/board/type2_box?type2=0">비사이클형 딜러</a><br>
		</fieldset>
				
		<fieldset id="identity_Box">
			<legend>아이덴티티</legend>	
			<a href ="/board/identity_box?identity=1">클래스 고유의 자원을 사용</a><br>
		</fieldset>
		
		<fieldset id="Hell_Box">
			<legend>헬컨텐츠</legend>
			<a href ="/board/hell_box?hell=1">헬컨텐츠</a><br>
		</fieldset>
		<!-- 필드셋 설정 완료 -->
		
	</div>
	
	
	<%
	//코딩시작
		Dao dao = new Dao();
	// Dao dao 객체 생성
	int sessionTimeoutSeconds = 10;
	request.getSession().setMaxInactiveInterval(sessionTimeoutSeconds);

	// com.wsbh.c.Controller 에 있는 Servlet Controller에 setAttribute에 있는것들을 불러옴
		String gender_Sel = (String)session.getAttribute("gender_Sel");
		gender_Sel = (gender_Sel !=null)?gender_Sel : "";
	// null이 아니면 그대로 null이면 "" 공백 사용
		String unit_Sel = (String)session.getAttribute("unit_Sel");
		unit_Sel = (unit_Sel !=null)?unit_Sel : "";
		
		String cost_Sel = (String)session.getAttribute("cost_Sel");
		cost_Sel = (cost_Sel !=null)?cost_Sel : "";
		
		String type1_Sel = (String)session.getAttribute("type1_Sel");
		type1_Sel = (type1_Sel !=null)?type1_Sel : "";
		
		String type2_Sel = (String)session.getAttribute("type2_Sel");
		type2_Sel = (type2_Sel !=null)?type2_Sel : "";
		
		String identity_Sel = (String)session.getAttribute("identity_Sel");
		identity_Sel = (identity_Sel !=null)?identity_Sel : "";
		
		String hell_Sel = (String)session.getAttribute("hell_Sel");
		hell_Sel = (hell_Sel !=null)?hell_Sel : "";
		
	// 불러오기 완료
	
		Dto dto = new Dto(gender_Sel, 
				unit_Sel, 
				cost_Sel,
				type1_Sel,
				type2_Sel,
				identity_Sel,
				hell_Sel
				);
		
		ArrayList<Dto> dto_List = dao.list(dto);
	// Dto 객체만들고 ArrayList 생성
	%>
	
	<div id="layout2">
	<%
		for(int i=0; i<dto_List.size();i++){
	// for 문을 통해서 돌림
	%>
	
	<div class="class_img">
	<img src="/class_img/<%=dto_List.get(i).c_Class %>.jpg" width="300px" height="300px">
	<span class = "imtext">
	<%=
	dto_List.get(i).c_Name
	%>
	<br> 
	<%=
	dto_List.get(i).c_Class
	%>
    </span>
	</div>
	<%
		}
	%>
	</div>
</body>
</html>