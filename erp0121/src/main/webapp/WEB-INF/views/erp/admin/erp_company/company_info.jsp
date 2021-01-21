<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/company_info.css">
<!-- 여기안에 내용을 복사하시면 됩니다! -->
<div class="page_wrap bg_white noto font_14">
        <div class="page_main flex space_between" style="border-bottom: 1px solid #ccc;">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">회사정보관리<i class="fas fa-chevron-right p_lr10"></i>1. 회사기초정보입력</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="">
                        <form id="companyFrm" method="POST" action="${pageContext.request.contextPath}/admin/company" enctype="multipart/form-data">
                            <div class="table_title">
                                <i class="fas fa-edit"></i>회사정보입력
                            </div>
                            <table class="input_list m_b10">
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">사업자등록번호</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comNum" maxlength="12" id="comNum" value="${company.comNum}" autoComplete="off" class="input_100" required placeholder="사업자등록번호를 입력해주세요" />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">회사명(한글)</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comName" maxlength="50" id="comName" value="${company.comName}" class="input_100" autoComplete="off" required placeholder="회사명을 입력해주세요" />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">회사명(영문)</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comNameEng" maxlength="50" id="comNameEng" value="${company.comNameEng}" class="input_100" autoComplete="off" required placeholder="회사명을 영문으로 입력해주세요" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">대표자명</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comCeo" maxlength="10" id="comCeo" value="${company.comCeo}" class="input_100" autoComplete="off" required placeholder="대표자명을 입력해주세요" />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">업태</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comType" maxlength="30" id="comType" value="${company.comType}" class="input_100" autoComplete="off" required placeholder="업태를 입력해주세요" />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">종목</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comItem" maxlength="30" id="comItem" value="${company.comItem}" class="input_100" autoComplete="off" required placeholder="종목을 입력해주세요" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">우편번호</td>
                                    <td class="p_lr3" onClick="execDaumPostcode();">
                                        <input type="text" name="comPost" maxlength="15" id="empPost" value="${company.comPost}" class="input_100" autoComplete="off" required placeholder="우편번호를 입력해주세요" readonly/>
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">주소</td>
                                    <td class="p_lr3" colspan="3">
                                        <input type="text" name="comAddress" id="empAddress" value="${company.comAddress}" maxlength="100" class="input_100" autoComplete="off" required placeholder="주소를 입력해주세요" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">전화번호</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comTel" maxlength="13" id="comTel" value="${company.comTel}" class="input_100" autoComplete="off" required />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">휴대번호</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comCp" maxlength="13" id="comCp" value="${company.comCp}" class="input_100" autoComplete="off" required />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">팩스번호</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comFax" maxlength="20" id="comFax" value="${company.comFax}" class="input_100" autoComplete="off" required />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">개업일</td>
                                    <td class="p_lr3">
                                        <input type="date" name="comOpendate" maxlength="10" id="comOpendate" value="${company.comOpendate}" class="input_100" autoComplete="off" required />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">ERP시작일</td>
                                    <td class="p_lr3">
                                        <input type="date" name="comErpdate" maxlength="10" id="comErpdate" value="${company.comErpdate}" class="input_100" autoComplete="off" required />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">법인등록번호</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comCorpNum" maxlength="14" id="comCorpNum" value="${company.comCorpNum}" class="input_100" autoComplete="off" required />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">E-mail</td>
                                    <td class="p_lr3">
                                        <input type="email" name="comEmail" maxlength="15" id="comEmail" value="${company.comEmail}" class="input_100" autoComplete="off" required />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">웹사이트URL</td>
                                    <td class="p_lr3" colspan="3">
                                        <input type="text" name="comUrl" id="comUrl" value="${company.comUrl}" maxlength="100" class="input_100" autoComplete="off" required />
                                    </td>
                                </tr>
                            </table>
                            <div class="table_title">
                                <i class="fas fa-edit"></i>
                                웹사이트정보등록
                            </div>
                            <table class="input_list m_b10">
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">웹사이트 접근권한</td>
                                    <td class="p_lr3">
                                        <select class="sel_100" name="comAuth" id="comAuth">
                                            <option value="1" <c:if test="${company.comAuth eq '1'}"> selected </c:if> >1</option>
                                            <option value="2" <c:if test="${company.comAuth eq '2'}"> selected </c:if> >2</option>
                                            <option value="3" <c:if test="${company.comAuth eq '3'}"> selected </c:if> >3</option>
                                            <option value="4" <c:if test="${company.comAuth eq '4'}"> selected </c:if> >4</option>
                                        </select>
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">로고타이틀</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comLogo" maxlength="20" id="comLogo" value="${company.comLogo}" class="input_100" autoComplete="off" />
                                    </td>
                                    <td class="bg_gray weight_700 td_10 center">로고서브타이틀</td>
                                    <td class="p_lr3">
                                        <input type="text" name="comSublogo" maxlength="50" id="comSublogo" value="${company.comSublogo}" class="input_100" autoComplete="off" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center" style="vertical-align:top; padding-top:10px;">웹사이트 메뉴 </td>
                                    <td class="p_lr3" colspan="5">
		                            	<input type="text" name="comWebMenu" maxlength="100" id="comWebMenu" value="${company.comWebMenu}" class="input_100" style="margin-bottom:3px;" autoComplete="off"  placeholder="메뉴를 세미콜론(;)으로 구분하여 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">메뉴 연결 주소</td>
                                    <td class="p_lr3" colspan="5">
                                        <input type="text" name="comWebMenuUrl" maxlength="100" id="comWebMenuUrl" value="${company.comWebMenuUrl}" class="input_100" autoComplete="off" placeholder="메뉴에 연결할 페이지 주소를 세미콜론(;)으로 구분하여 입력하세요."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">메인 상단 텍스트</td>
                                    <td class="p_lr3" colspan="5">
                                        <input type="text" name="comWebTop" maxlength="100" id="comWebTop" value="${company.comWebTop}" class="input_100" autoComplete="off" placeholder="홈페이지 중앙 상단에 보여집니다."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">메인 하단 텍스트</td>
                                    <td class="p_lr3" colspan="5">
                                        <input type="text" name="comWebBottom" maxlength="100" id="comWebBottom" value="${company.comWebBottom}" class="input_100" autoComplete="off" placeholder="홈페이지 중앙 하단에 보여집니다."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">웹사이트 Copyright</td>
                                    <td class="p_lr3" colspan="5">
                                        <input type="text" name="comWebCopyright" maxlength="200" id="comWebCopyright" value="${company.comWebCopyright}" class="input_100" autoComplete="off" placeholder="홈페이지 하단에 보여집니다." />
                                    </td>
                                </tr>
                            </table>
                            <div class="table_title">
                                <i class="fas fa-edit"></i>
                                이미지정보 등록
                            </div>
                            <table class="input_list">
                                <tr>
                                    <td class="bg_gray weight_700 td_10 center">대표자 이미지</td>
                                    <td class="bg_gray weight_700 td_10 center">회사 도장 이미지</td>
                                    <td class="bg_gray weight_700 td_10 center">대표자 도장 이미지</td>
                                    <td class="bg_gray weight_700 td_10 center">대표자 서명 이미지</td>
                                </tr>
                                <tr>
                                    <td class="p_5">
                                        <div class="photo_area">
                                        	<c:choose>
                                        		<c:when test="${company.comCeoImg ne null}">
                                        			<img src="${pageContext.request.contextPath}/companyImg/${company.comCeoImg}" />
                                        		</c:when>
                                        		<c:otherwise>
		                                            <img src="${pageContext.request.contextPath}/images/no.jpg" id="comCeoImg" />
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                        <div class="photo_btn center m_t5">
                                            <input type="file" name="comCeoImgFile" id="comCeoImgBtn" class="input_100" value="${company.comCeoImg}" />
                                        </div>
                                    </td>
                                    <td class="p_5">
                                        <div class="photo_area">
                                        	<c:choose>
                                        		<c:when test="${company.comStampImg ne null}">
                                        			<img src="${pageContext.request.contextPath}/companyImg/${company.comStampImg}" />
                                        		</c:when>
                                        		<c:otherwise>
		                                            <img src="${pageContext.request.contextPath}/images/no.jpg" id="comStampImg" />
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                        <div class="photo_btn center m_t5">
                                            <input type="file" name="comStampImgFile" id="comStampImgBtn" class="input_100" value="${company.comStampImg}"/>
                                        </div>
                                    </td>
                                    <td class="p_5">
                                        <div class="photo_area">
                                       		<c:choose>
                                        		<c:when test="${company.comCeoStampImg ne null}">
                                        			<img src="${pageContext.request.contextPath}/companyImg/${company.comCeoStampImg}" />
                                        		</c:when>
                                        		<c:otherwise>
		                                            <img src="${pageContext.request.contextPath}/images/no.jpg" id="comCeoStampImg" />
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                        <div class="photo_btn center m_t5">
                                            <input type="file" name="comCeoStampImgFile" id="comCeoStampImgBtn" class="input_100" value="${company.comCeoStampImg}"/>
                                        </div>
                                    </td>
                                    <td class="p_5">
                                        <div class="photo_area">
                                        	<c:choose>
                                        		<c:when test="${company.comCeoSignImg ne null}">
                                        			<img src="${pageContext.request.contextPath}/companyImg/${company.comCeoSignImg}" />
                                        		</c:when>
                                        		<c:otherwise>
		                                            <img src="${pageContext.request.contextPath}/images/no.jpg" id="comCeoSignImg" />
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                        <div class="photo_btn center m_t5">
                                            <input type="file" name="comCeoSignImgFile" id="comCeoSignImgBtn" class="input_100" value="${company.comCeoSignImg}"/>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="btn-grp center m_t10">
                                <button type="submit" class="btn_blue">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script src = "${pageContext.request.contextPath}/js/company.js"></script>

<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp" %>