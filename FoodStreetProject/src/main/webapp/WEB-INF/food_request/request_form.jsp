<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="request_form_wrap">
	<div class="request_form_all_box container_small">
		<div class="top_sub_title">
			<h2>맛집신청</h2>
		</div>
		<div class="requset_step_banner">
			<div class="step_all_box">
				<div class="step_box_one">
					<h2 id="step_col">STEP 1</h2>
					<i class="fa fa-pencil-square-o" id="step_col" aria-hidden="true"></i>
					<p id="step_col">해당 페이지에서 신청항목을<br>
					작성하여 맛집 신청 진행</p>
				</div>
				<div class="step_box_one">
					<h2>STEP 2</h2>
					<i class="fa fa-users" aria-hidden="true"></i>
					<p>푸드스트릿 운영진이 신청내역을<br>
					확인 후 평가 진행</p>
				</div>
				<div class="step_box_one">
					<h2>STEP 3</h2>
					<i class="fa fa-desktop" aria-hidden="true"></i>
					<p>평가 통과 후<br>
					푸드스트릿 맛집리스트에 업로드</p>
				</div>
			</div>
		</div>
		<div class="from_content_box">
			<div class="form_sub_title request_title_top">
				<h2>신청항목<span>* 필수입력사항</span></h2>
			</div>
			<form action="/request/success" method="post" onsubmit="return submitRequest();"  enctype="multipart/form-data">
				<c:choose>
					<c:when test="${member == null}">
						<input type="hidden" name="id" value="비회원">
					</c:when>
					<c:otherwise>
						<input type="hidden" name="id" value="${member.id}">
					</c:otherwise>
				</c:choose>				
				<input type="hidden" name="state" value="대기중">
				<div class="form_content">
					<table class="form_tb_all">
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<tbody>
							<tr>
								<th><span>*</span>신청자</th>
								<td>
									<input type="text" name="name" class="name_form" placeholder="ex) 홍길동" value="${member.name}"/>
								</td>
							</tr>
							<tr>
								<th><span>*</span>가게이름</th>
								<td>
									<input type="text" name="food_store" class="food_store_form" placeholder="ex) 아웃백"/>
								</td>
							</tr>
							<tr>
								<th><span>*</span>지점명</th>
								<td>
									<input type="text" name="place_name" class="place_name_form" placeholder="ex) 강남점"/>
								</td>
							</tr>
							<tr>
								<th rowspan="2"><span>*</span>주소</th>
								<td>
									<input type="text" name="address1" class="address1_form" placeholder="우편번호"/>
									<button type="button" id="hp_sms_btn" onclick="execPostCode();">주소찾기</button>
									<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
									<script src="/js/address_script.js"></script>
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="address2" class="address2_form" id="request_address_form" placeholder="상세주소"/>
								</td>
							</tr>
							<tr>
								<th><span>*</span>음식사진</th>
								<td>
									<input type="file" name="upload" class="food_img_form" value="no" multiple/>
									<p id="small_point_text">※ 이미지를 많이 추가하시면 평가에 유리합니다.</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>한줄평</th>
								<td>
									<input type="text" name="comment" class="comment_form" placeholder="ex) 여긴 찐 맛집이다!"/>
								</td>
							</tr>
							<tr>
								<th><span>*</span>추천이유</th>
								<td>
									<textarea name="reason" class="reason_form" placeholder="해당 맛집을 추천하는 이유!? 구체적으로 작성해주셔야 맛집리스트에 등록될 가능성이 높아집니다 :-)"></textarea>
								</td>
							</tr>						
						</tbody>
					</table>
				</div>
				<div class="request_notice">
					<p>※ 신청만 하고 등록되는 것이 아닌 평가를 거쳐서 등록되기 때문에 정성스럽게 작성 부탁드립니다.</p>
					<p>※ 평가는 신청 후 2-3일 정도 걸리며, 만약 평가에서 탈락된다면 이메일로 공지드립니다.</p>
					<p>※ 평가에서 통과된 맛집들은 푸드스트릿 운영진들이 추가적인 조사 후 내용과 함께 업로드되니 많은 관심 부탁드립니다.</p>
				</div>
				<div class="form_all_btn">
					<button type="button" onclick="location.href='/request';" class="btn_cancle">초기화</button>
					<button type="submit" class="btn_confirm">신청하기</button>
				</div>
			</form>
		</div>
	</div>
</div>